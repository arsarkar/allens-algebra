BASE <http://example.com/base/>
PREFIX mapper: <http://www.ontotext.com/mapper/>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://industrialontologies.org/>
INSERT {
    GRAPH mac:machinedata
    {
		?i1 bfo:BFO_0000063 ?i2.
        bfo:BFO_0000063 a owl:ObjectProperty.
	}
}
WHERE {
    ?i1 core:hasValueExpressionAtAllTimes ?ie1.
    ?i2 core:hasValueExpressionAtAllTimes ?ie2.        
    ?ie1 core:hasDateTimeValue ?t1.
    ?ie2 core:hasDateTimeValue ?t2.
    FILTER(?t1 < ?t2 && ?i1 != ?i2)
}