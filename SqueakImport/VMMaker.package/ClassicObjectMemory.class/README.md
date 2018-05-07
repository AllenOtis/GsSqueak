ClassicObjectMemory represents the original Squeak object memory used by Interpreter. Some methods from ObjectMemory are modified or extended in other object memory implementations such as NewObjectMemory. The original implementations of these methods have been moved to ClassicObjectMemory in order to retain the original Squeak object memory while enabling variations such as NewObjectMemory to be implemented as subclasses of ObjectMemory.