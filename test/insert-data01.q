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
        ?p  a owl:NamedIndividual;
            a bfo:BFO_0000015 .
        bfo:BFO_0000015 a owl:Class.
        ?p bfo:BFO_0000199 ?tr.
        bfo:BFO_0000199 a owl:ObjectProperty.
        ?tr a owl:NamedIndividual;
            a bfo:BFO_0000202.
        ?tr bfo:BFO_0000222 ?st.
        ?tr bfo:BFO_0000224 ?et.
        bfo:BFO_0000222 a owl:ObjectProperty.
        bfo:BFO_0000224 a owl:ObjectProperty.
        ?st a owl:NamedIndividual;
            a bfo:BFO_0000203.
        ?et a owl:NamedIndividual;
            a bfo:BFO_0000203.
        ?st core:hasValueExpressionAtAllTimes ?ste.
        ?et core:hasValueExpressionAtAllTimes ?ete.
        ?ste a owl:NamedIndividual;
            a core:TemporalInstantValueExpression.
        ?ete a owl:NamedIndividual;
            a core:TemporalInstantValueExpression.
        core:hasValueExpressionAtAllTimes a owl:ObjectProperty.
        ?ste core:hasDateTimeStampInXSDExpression ?v_st.
        ?ete core:hasDateTimeStampInXSDExpression ?v_et.  
        core:hasDateTimeStampInXSDExpression a owl:DatatypeProperty.
    }
} WHERE {
    SERVICE <rdf-mapper:ontorefine:1826513931367> {
        # Columns as variables:
        #   ?c_process, ?c_start, ?c_end
        # Metadata as variables:
        #   ?row_index, ?record_id
        BIND(IRI(mapper:encode_iri(?c_process)) as ?p).
        BIND(CONCAT("tr_", str(?c_process)) as ?temp1).
        BIND(IRI(mapper:encode_iri(?temp1)) as ?tr).
        BIND(CONCAT("sti_", STR(?c_process)) as ?temp2).
        BIND(IRI(mapper:encode_iri(?temp2)) as ?st).
        BIND(CONCAT("eti_", STR(?c_process)) as ?temp3).
        BIND(IRI(mapper:encode_iri(?temp3)) as ?et). 
        BIND(CONCAT("ste_", STR(?c_process)) as ?temp4).
        BIND(IRI(mapper:encode_iri(?temp4)) as ?ste).
        BIND(CONCAT("ete_", STR(?c_process)) as ?temp5).
        BIND(IRI(mapper:encode_iri(?temp5)) as ?ete).        
        BIND(STRDT(?c_start, xsd:dateTimeStamp) as ?v_st).
        BIND(STRDT(?c_end, xsd:dateTimeStamp) as ?v_et)
    }
}