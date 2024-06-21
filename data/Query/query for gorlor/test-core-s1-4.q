BASE <http://example.com/base#>
PREFIX bfo: <http://purl.obolibrary.org/obo/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX core: <https://spec.industrialontologies.org/ontology/core/Core/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mac: <http://example.com/>

SELECT ?a from mac:gorlor
WHERE{
    ?inc a core:Event;
         bfo:BFO_0000199/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?i.      
    {    
    	?g a core:GainOfRole;
           bfo:BFO_0000199 ?gint;
           core:hasOutput ?r;
           bfo:BFO_0000167 ?a.
        ?gint bfo:BFO_0000224/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?bi.
        FILTER(?bi <= ?i)

        ?l a core:LossOfRole;
           bfo:BFO_0000199 ?lint;
           core:hasInput ?r;
           bfo:BFO_0000167 ?a.
        ?lint bfo:BFO_0000222/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?ai.
        FILTER(?i <= ?ai)
    }UNION
    {
        ?int bfo:BFO_0000222/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?bi.
        ?int bfo:BFO_0000224/core:hasValueExpressionAtAllTimes/core:hasDateTimeValue ?ai.
        ?p bfo:BFO_0000199 ?int;
           bfo:BFO_0000167 ?a.
        FILTER(?bi <= ?i)
        FILTER(?i <= ?ai)       
        
    }
    FILTER (STR(?inc) = "http://www.example.com/base#incident2")
}
