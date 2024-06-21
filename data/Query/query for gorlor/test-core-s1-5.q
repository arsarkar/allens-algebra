BASE <http://example.com/base#>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://example.com/>

SELECT ?i from mac:gorlor
WHERE{
	?l a core:LossOfRole;
       bfo:BFO_0000199 ?lint;
       bfo:BFO_0000167 ?a.
    ?lint bfo:BFO_0000224/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?i.
    FILTER(STR(?a) = "http://www.example.com/base#operator2" )
}
