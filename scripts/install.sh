#!/usr/bin/env bash

################################################################################
# Variables used throughout the whole program.
################################################################################
OUTPUT=
GEMSTONE_VERSION=
EA_VERSION=
STONE_NAME=
FORCE=false

################################################################################
# Set colors used by console prints as environment variables.
################################################################################
readonly YELLOW='\033[1;33m'
readonly ORANGE='\033[0;33m'
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly NC='\033[0m' # No Color

################################################################################
# Set status messages used to display the current progress
################################################################################
readonly SUCCESS="[ ${GREEN}SUCCESS${NC} ]"
readonly ERRORED="[ ${RED}ERRORED${NC} ]"
readonly PENDING="[ ${YELLOW}PENDING${NC} ]"
readonly REQUIRE="[ ${YELLOW}REQUIRE${NC} ]"
readonly WARNING="[ ${ORANGE}WARNING${NC} ]"

################################################################################
# Print usage of this program
################################################################################
install_usage() {
  echo "the author is confused"
}

################################################################################
# Rewrite current command as errored and print command output.
################################################################################
print_pending() {
  local message
  message="$1"

  echo -en "${PENDING} ${message}"
  tput sc
  echo 
}

################################################################################
# Rewrite current command as errored and print command output.
################################################################################
print_success() {
  local message
  message="$1"

  tput rc
  echo -e "\r${SUCCESS}"
}

################################################################################
# Checks wheter the last command was successful
# global:
#   ?   exit code of last command
################################################################################
check_errors() {
  
  if [[ $? -gt 0 ]]; then
    errored
  else
    print_success
  fi

}

################################################################################
# Checks whether the last command have a non-zero exit code. If not, emit a warning.
# global:
#   ?   exit code of last command
################################################################################
check_warning() {
  if [[ $? -gt 0 ]]; then
    warn
  else
    print_success
  fi
}

warn() {
  local message
  message="$1"

  echo -e "\r$WARNING" 

  if ! [[ -z "${message+x}" ]]; then
    echo -e "${WARNING} Message: $message"     
  fi

  if ! [[ -z "${OUTPUT}" ]]; then
    echo -e "${WARNING} Command output:"
    echo "$OUTPUT"
  fi
}

################################################################################
# Rewrite current command as errored and print command output.
# local:
#   OUTPUT
################################################################################
errored() {
  local message
  message="$1"

  tput rc
  echo -e "\r${ERRORED}"

  if ! [[ -z "${message+x}" ]]; then
    echo -e "${ERRORED} Message: $message"     
  fi

  if ! [[ -z "${OUTPUT}" ]]; then
    echo -e "${ERRORED} Command output:"
    echo "$OUTPUT"
  fi

  exit 1
}

################################################################################
# Exit program, because GemStone bin scripts are missing.
################################################################################
gemstone_scripts_path_error() {
  echo -e "GemStone scripts are not added to path"
  exit 1
}

################################################################################
# Checks whether the latest bash version is installed
################################################################################
check_bash_version() {
  if ! [[ ( ${BASH_VERSINFO[0]} -ge 4 ) && ( ${BASH_VERSINFO[1]} -ge 3 ) ]]; then
    echo -e "$ERRORED You need at least bash version greater than 4.3.0, your version: $BASH_VERSION" 
    exit 1
  fi
}

################################################################################
# Get user input
################################################################################
get_user_input() {
  local message options default result
  declare -n __resultVar=$4
  message="$1"
  options="$2"
  default="$3"

  printf "$REQUIRE $message [ $options ] "
  read __resultVar
  __resultVar=${__resultVar:-${default}}
}

################################################################################
# Abort if os requirements are not met.
################################################################################
check_gs_devkit() {
  local response

  if [[ -z "${GS_HOME+x}" ]]; then
    get_user_input "Do you want to install GsDevKit_home?" "Y | n" Y response

    if [[ "${response,,}" = y ]]; then
      install_gs_devkit
    else
      echo -e "$ERRORED GsDevKit_home missing"
      exit 1
    fi
  fi
  
}

################################################################################
# Abort if os requirements are not met.
################################################################################
install_gs_devkit() {
  print_pending "Cloning GsDevKit_home"
  git clone -q https://github.com/GsDevKit/GsDevKit_home.git
  check_errors
  pushd GsDevKit_home >/dev/null
  . bin/defHOME_PATH.env    # define GS_HOME env var and put $GS_HOME into PATH
  popd >/dev/null
  print_pending "Installing GsDevKit_home"
  installServerClient >/dev/null 2>&1
  check_errors
}

################################################################################
# Abort installation if required environment variables are missing.
#
# globals:
#   GS_HOME
################################################################################
check_env_variables() {
  which createClient >/dev/null 2>&1
  if [[ $? -gt 0 ]]; then
    gemstone_scripts_path_error
  fi

  which createStone >/dev/null 2>&1
  if [[ $? -gt 0 ]]; then
    gemstone_scripts_path_error
  fi

  which todeIt >/dev/null 2>&1
  if [[ $? -gt 0 ]]; then
    gemstone_scripts_path_error
  fi

  which downloadGemStone >/dev/null 2>&1
  if [[ $? -gt 0 ]]; then
    gemstone_scripts_path_error
  fi
}

################################################################################
# Abort if os requirements are not met.
################################################################################
check_os() {
  readonly unamestr=`uname`

  if ! [[ "$unamestr" == 'Linux' || "$unamestr" == 'Darwin' ]]; then
    errored "Operating system not supported. Please open an issue for your OS."
    exit 1
  fi
}

################################################################################
# Downloads specified GemStone Version
################################################################################
download_gemstone() {

  download_gemstone_usage() { echo "$0 <gemstone_version> [<early_access_version>]"; exit 1;}

  local gs_version ea_version

  if [[ -z "${1+x}" && -z "${2+x}" ]]; then
    download_gemstone_usage
  fi

  gs_version="$1"
  ea_version="$2"

  OUTPUT=$(downloadGemStone -f -d ${gs_version}${ea_version} $gs_version)
  #downloadGemStone -f -d ${gs_version}${ea_version} $gs_version >/dev/null 2>&1
}

check_stone_exists() {
  local stone_name
  stone_name="$1"

  stones 2>&1 | grep -e "\t${stone_name}\$"

  return $?
}

################################################################################
# 
################################################################################
setup_gs_squeak() {
  local repo_path stone_name gs_version stone_exists response 

  repo_path=`pwd`/../squeak-modifications/pre-squeak-import

  stone_name="$1"
  gs_version="$2"

  check_stone_exists
  stone_exists=$?

  if [[ $stone_exists = 0 ]]; then
    if [[ $FORCE = true ]]; then
      print_pending "Recreating stone named $stone_name"
      createStone -f "$stone_name" $gs_version
      check_errors
    else
      echo -e "$WARNING Stone named $stone_name already exists"
      get_user_input "Do you want to recreate it?" "[O]VERWRITE | [r]eset | [a]bort" OVERWRITE RESPONSE 

      case "${response,,}" in
        o)
          print_pending "Recreating stone named $stone_name"
          createStone -f "$stone_name" $gs_version
          check_errors
          ;;
        r)
          print_pending "Restoring stone named $stone_name from tode backup"
          todeRestore "$stone_name" tode.dbf
          check_errors
          ;;
        a)
          echo -e "$SUCCESS Aborting.. That's okay."
          exit 0
          ;;
        *)
          echo -e "$ERRORED Unknown option"
          exit 1 # TODO looooooop!
          ;;
      esac
    fi 
  else
    print_pending "Creating stone named $stone_name"
    createStone "$stone_name" $gs_version
    check_errors
  fi

  
  pushd $repo_path >/dev/null
  for package in *.package; do
    local package_name=$(echo "$package" | cut -d'.' -f 1)
    print_pending "Loading $package_name"
    OUTPUT=$(todeIt $stone_name mc load "$package_name" filetree://$repo_path >/dev/null 2>&1)
    check_errors
  done
  popd >/dev/null
}


################################################################################
# Parameter handling
################################################################################
POSITIONAL=()

while [[ $# -gt 0 ]]; do

key="$1"
case $key in
    -h|--help)
      install_usage 
      exit 0
      ;;
    --gs-version)
      GEMSTONE_VERSION="$2"
      shift # past argument
      shift # past value
      ;;
    --ea-version)
      EA_VERSION="$2"
      shift
      shift
      ;;
    -s|--stone-name)
      STONE_NAME="$2"
      shift
      shift
      ;;
    -f|--force)
      FORCE=true
      shift
      ;;
    *)    # unknown option
      install_usage
      # not supported
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

STONE_NAME="${STONE_NAME:-GsSqueak}"
GEMSTONE_VERSION="${GEMSTONE_VERSION:-3.5.0}"

check_os
check_gs_devkit
check_env_variables

print_pending 'Downloading GemStone'
downloadGemStone $GEMSTONE_VERSION $EA_VERSION # wip
check_warning

setup_gs_squeak $STONE_NAME $GEMSTONE_VERSION
