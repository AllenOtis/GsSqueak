querying
fetchMethod: queryCode

	^ (self repository fetch: self methodProxyClass name query: queryCode)
		ifNotNil: [:method | method environment: self environment]