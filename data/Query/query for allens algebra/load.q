BASE <http://example.com/base/>
PREFIX mapper: <http://www.ontotext.com/mapper/>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX mac: <http://industrialontologies.org/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
INSERT {
    GRAPH mac:machinedata
    {
        #create process subclass and instance
        ?o_activity a owl:NamedIndividual;
            		a ?act_t .
        ?act_t rdfs:subClassOf bfo:BFO_0000015 .
        bfo:BFO_0000015 a owl:Class.
        ?o_machine a owl:NamedIndividual;
                   a ?machine_t.
        ?machine_t rdfs:subClassOf core:PieceOfEquipment .        
        core:PieceOfEquipment a owl:Class.
        ?o_machine bfo:BFO_0000166 ?o_activity.
        bfo:BFO_0000166 a owl:ObjectProperty.
        ?o_worker a core:Agent.
	core:Agent a owl:Class.
        ?o_worker bfo:BFO_0000166 ?o_activity.
        ?part_t rdfs:subClassOf core:MaterialArtifact.
        core:MaterialArtifact a owl:Class.
        ?o_part a ?part_t.
        ?o_part core:isOutputOf ?o_activity.
        core:isOutputOf a owl:ObjectProperty.
        ?o_activity bfo:BFO_0000199 ?o_tempregion.
        bfo:BFO_0000199 a owl:ObjectProperty.
        ?o_tempregion a owl:NamedIndividual;
            		  a bfo:BFO_0000202.
        ?o_tempregion bfo:BFO_0000222 ?o_startinstant.
        ?o_tempregion bfo:BFO_0000224 ?o_endinstant.
        bfo:BFO_0000222 a owl:ObjectProperty.
        bfo:BFO_0000224 a owl:ObjectProperty.
        ?o_startinstant a owl:NamedIndividual;
            		a bfo:BFO_0000203.
        ?o_endinstant a owl:NamedIndividual;
            		a bfo:BFO_0000203.
        ?o_startinstant core:hasValueExpressionAtAllTimes ?ste.
        ?o_endinstant core:hasValueExpressionAtAllTimes ?ete.
	core:hasValueExpressionAtAllTimes a owl:ObjectProperty.
        ?ste a owl:NamedIndividual;
            a core:TemporalInstantValueExpression.
        ?ete a owl:NamedIndividual;
            a core:TemporalInstantValueExpression.
	core:TemporalInstantValueExpression a owl:Class.
        ?ste core:hasDateTimeValue ?o_starttime.
        ?ete core:hasDateTimeValue ?o_endtime.  
        core:hasDateTimeValue a owl:DatatypeProperty.
    }
} 
WHERE {
    SERVICE <rdf-mapper:ontorefine:1886406171592> {
        # Columns as variables:
        #   ?c_Case_ID, ?c_Activity, ?c_Resource, ?c_Start_Timestamp, ?c_Complete_Timestamp,
        #   ?c_Span, ?c_Work_Order__Qty, ?c_Part_Desc_, ?c_Worker_ID, ?c_Report_Type,
        #   ?c_Qty_Completed, ?c_Qty_Rejected, ?c_Qty_for_MRB, ?c_Rework
        # Metadata as variables: http://purl.obolibrary.org/obo/BFO_0000202
        #   ?record_id, ?row_index
        # activity type
	BIND(IRI(mapper:encode_iri(?c_Activity)) as ?act_t).
        # activity instance
	BIND(CONCAT("p_", STR(?row_index), "%", STR(?c_Start_Timestamp), STR(?c_Complete_Timestamp)) as ?temp1).
        BIND(IRI(mapper:encode_iri(?temp1)) as ?o_activity).
        # machine type
	BIND(IRI(mapper:encode_iri(?c_Resource)) as ?machine_t).
        # machine instance
	BIND(CONCAT("M_", STR(?row_index), STR(?c_Resource)) as ?temp7).
        BIND(IRI(mapper:encode_iri(?temp7)) as ?o_machine).
        # worker instance
	BIND(CONCAT("W_", STR(?c_Worker_ID)) as ?temp8).
        BIND(IRI(mapper:encode_iri(?temp8)) as ?o_worker).        
        # output part type
	BIND(IRI(mapper:encode_iri(?c_Part_Desc_)) as ?part_t).
        # output part instance
	BIND(CONCAT("R_", STR(?row_index), STR(?c_Part_Desc_)) as ?temp9).
        BIND(IRI(mapper:encode_iri(?temp9)) as ?o_part).        
        # temporal interval 
	BIND(CONCAT("tr_", STR(?row_index), STR(?c_Start_Timestamp), STR(?c_Complete_Timestamp)) as ?temp2).
        BIND(IRI(mapper:encode_iri(?temp2)) as ?o_tempregion).
	# start time instant
	BIND(CONCAT("st_", STR(?row_index), STR(?c_Start_Timestamp)) as ?temp3).
        BIND(IRI(mapper:encode_iri(?temp3)) as ?o_startinstant).
        # end time instant
	BIND(CONCAT("et_", STR(?row_index), STR(?c_Complete_Timestamp)) as ?temp4).
        BIND(IRI(mapper:encode_iri(?temp4)) as ?o_endinstant).
        # start time instance value expression
	BIND(CONCAT("ste_", STR(?row_index), STR(?c_Start_Timestamp)) as ?temp5).
        BIND(IRI(mapper:encode_iri(?temp5)) as ?ste).
        # end time instance value expression
	BIND(CONCAT("ete_", STR(?row_index), STR(?c_Complete_Timestamp)) as ?temp6).
        BIND(IRI(mapper:encode_iri(?temp6)) as ?ete).  
	# date times       
        BIND(STRDT(?c_Start_Timestamp, xsd:dateTime) as ?o_starttime).
        BIND(STRDT(?c_Complete_Timestamp, xsd:dateTime) as ?o_endtime)
        FILTER(?row_index < 1000)
    }
}