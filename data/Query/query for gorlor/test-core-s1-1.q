BASE <http://example.com/base#>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://example.com/>

SELECT ?duration from mac:gorlor
WHERE{
    ?g a core:GainOfRole;
       bfo:BFO_0000199 ?gint;
       core:hasOutput ?r;
       bfo:BFO_0000167 ?a.
    ?gint bfo:BFO_0000222/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?start.
    ?l a core:LossOfRole;
       bfo:BFO_0000199 ?lint;
       core:hasInput ?r;
       bfo:BFO_0000167 ?a.
    ?lint bfo:BFO_0000224/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?end.
    FILTER(STR(?a) = "http://www.example.com/base#operator1")
    BIND((?end - ?start) as ?duration)
}
