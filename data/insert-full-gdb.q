BASE <http://example.com/base/>
PREFIX mapper: <http://www.ontotext.com/mapper/>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX mac: <http://industrialontologies.org/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
INSERT {
    GRAPH mac:machinedata
    {
    ?act_t rdfs:subClassOf bfo:BFO_0000015;
     	   a owl:Class.
    ?o_tempregion a bfo:BFO_0000202;
            	  a owl:NamedIndividual.	      
    ?o_activity a ?act_t ;
            	a owl:NamedIndividual;
                bfo:BFO_0000199 ?o_tempregion .
    bfo:BFO_0000199 a owl:Objectproperty.
    ?o_startinstant a bfo:BFO_0000203;
            	  a owl:NamedIndividual.
    ?o_endinstant a bfo:BFO_0000203;
            	  a owl:NamedIndividual.
    ?o_tempregion bfo:BFO_0000222 ?o_startinstant;
                  bfo:BFO_0000224 ?o_endinstant.
    bfo:BFO_0000222 a owl:Objectproperty.
    bfo:BFO_0000224 a owl:Objectproperty.
    ?o_startinstant rdf:value ?o_starttime.
    ?o_endinstant rdf:value ?o_endtime.
    rdf:value a owl:DataProperty.
    }
} 
WHERE {
    SERVICE <rdf-mapper:ontorefine:2461545491892> {
        # Columns as variables:
        #   ?c_Case_ID, ?c_Activity, ?c_Resource, ?c_Start_Timestamp, ?c_Complete_Timestamp,
        #   ?c_Span, ?c_Work_Order__Qty, ?c_Part_Desc_, ?c_Worker_ID, ?c_Report_Type,
        #   ?c_Qty_Completed, ?c_Qty_Rejected, ?c_Qty_for_MRB, ?c_Rework
        # Metadata as variables: http://purl.obolibrary.org/obo/BFO_0000202
        #   ?row_index, ?record_id
        BIND(IRI(mapper:encode_iri(?c_Activity)) as ?act_t).
        BIND(CONCAT(STR(?record_id), STR(?c_Start_Timestamp), STR(?c_Complete_Timestamp)) as ?temp1).
        BIND(IRI(mapper:encode_iri(?temp1)) as ?o_activity).
        BIND(CONCAT(STR(?c_Start_Timestamp), STR(?c_Complete_Timestamp)) as ?temp2).
        BIND(IRI(mapper:encode_iri(?temp2)) as ?o_tempregion).
        BIND(STR(?c_Start_Timestamp) as ?temp3).
        BIND(IRI(mapper:encode_iri(?temp3)) as ?o_startinstant).
        BIND(STR(?c_Complete_Timestamp) as ?temp4).
        BIND(IRI(mapper:encode_iri(?temp4)) as ?o_endinstant).
        BIND(STRDT(?c_Start_Timestamp, xsd:dateTimeStamp) as ?o_starttime).
        BIND(STRDT(?c_Complete_Timestamp, xsd:dateTimeStamp) as ?o_endtime)
    }
}