BASE <http://example.com/base/>
PREFIX mapper: <http://www.ontotext.com/mapper/>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://industrialontologies.org/>

PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
#SELECT DISTINCT ?p1 ?p2 ?pt1 ?pt2 ?o1 ?o2 ?m1 ?m2 ?w1 ?w2 from mac:machinedata
SELECT DISTINCT ?o_end1 ?o_start2 from mac:machinedata
WHERE {    
    ?pt1 rdfs:subClassOf bfo:BFO_0000015 .
    ?pt2 rdfs:subClassOf bfo:BFO_0000015 .
    ?p1 a ?pt1.
    ?p2 a ?pt2.
    ?m1 a ?machine_t1.
    ?machine_t1 rdfs:subClassOf core:PieceOfEquipment .        
    ?m1 bfo:BFO_0000166 ?p1.
    ?m2 a ?machine_t2.
    ?part_t1 rdfs:subClassOf core:MaterialArtifact.
    ?o1 a ?part_t1;
        core:isOutputOf ?p1.
    ?part_t2 rdfs:subClassOf core:MaterialArtifact.
    ?o2 a ?part_t2;
        core:isOutputOf ?p2.
    ?machine_t2 rdfs:subClassOf core:PieceOfEquipment .        
    ?m2 bfo:BFO_0000166 ?p2.
    ?w1 a core:Agent;
    	bfo:BFO_0000166 ?p1.
    ?w2 a core:Agent;
    	bfo:BFO_0000166 ?p2.
	
	?p1 bfo:BFO_0000199 ?tr1.
    ?p2 bfo:BFO_0000199 ?tr2.
    ?tr1 bfo:BFO_0000224 ?et1.
    ?tr2 bfo:BFO_0000222 ?st2.
    ?et1 core:hasValueExpressionAtAllTimes ?ete1.
    ?st2 core:hasValueExpressionAtAllTimes ?ste2.
    ?ete1 core:hasDateTimeValue ?o_end1.
    ?ste2 core:hasDateTimeValue ?o_start2.
	?p1 core:temporallyOverlaps ?p2.
    FILTER(IRI("W_ID4493") = ?w1).
    FILTER(?pt1 != ?pt2 && ?w1 = ?w2)
}