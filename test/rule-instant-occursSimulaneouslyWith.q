BASE <http://example.com/base/>
PREFIX mapper: <http://www.ontotext.com/mapper/>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://industrialontologies.org/>
INSERT {
    GRAPH mac:allentest
    {
		?st core:occursSimoultaneouslyWith ?et.
        core:occursSimoultaneouslyWith a owl:ObjectProperty.
	}
}
WHERE {
    ?st core:hasValueExpressionAtAllTimes ?ste.
    ?et core:hasValueExpressionAtAllTimes ?ete.        
    ?ste core:hasDateTimeStampInXSDExpression ?v_st.
    ?ete core:hasDateTimeStampInXSDExpression ?v_et.
    FILTER(?st != ?et && ?v_st = ?v_et)
}