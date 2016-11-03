---
title: "Aggregate Functions (Azure Stream Analytics)"
ms.custom: na
ms.date: "2016-09-12"
ms.prod: "azure"
ms.reviewer: na
ms.service: "stream-analytics"
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: "reference"
applies_to: 
  - "Azure"
ms.assetid: 1fa11c79-3f97-4050-8d2c-b4cf61cdaf59
caps.latest.revision: 23
ms.author: "jeffstok"
manager: "jhubbard"
translation.priority.mt: 
  - "de-de"
  - "es-es"
  - "fr-fr"
  - "it-it"
  - "ja-jp"
  - "ko-kr"
  - "pt-br"
  - "ru-ru"
  - "zh-cn"
  - "zh-tw"
---
# Aggregate Functions (Azure Stream Analytics)
  Aggregate functions perform a calculation on a set of values and return a single value. Except for the COUNT function, aggregate functions ignore null values. Aggregate functions are frequently used with the GROUP BY clause of the SELECT statement.  
  
 All aggregate functions are deterministic. This means aggregate functions return the same value any time that they are called by using a specific set of input values.  
  
 Aggregate functions can be used as expressions only in the following:  
  
-   The select list of a SELECT statement (either a subquery or an outer query).  
  
-   A HAVING clause.  
  
 Stream Analytics Query Language provides the following aggregate functions:  
  
||||  
|-|-|-|  
|[AVG &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/avg--azure-stream-analytics-.md)|[COUNT &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/count--azure-stream-analytics-.md)|[Collect &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/collect--azure-stream-analytics-.md)|
|[CollectTOP &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/collecttop--azure-stream-analytics-.md)|[MAX &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/max--azure-stream-analytics-.md)|[MIN &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/min--azure-stream-analytics-.md)|
|[Percentile_Cont &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/percentile_cont--azure-stream-analytics-.md)  | [Percentile_Disc &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/percentile_disc--azure-stream-analytics-.md) |[STDEV &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/stdev--azure-stream-analytics-.md)|
|[STDEVP &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/stdevp--azure-stream-analytics-.md)|[SUM &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/sum--azure-stream-analytics-.md)| [TopOne &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/topone--azure-stream-analytics-.md)|
|[VAR &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/var--azure-stream-analytics-.md)|[VARP &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/varp--azure-stream-analytics-.md)|
  
## See Also  
 [Built-In Functions](../streamAnalyticsQueryLanguage/built-in-functions--azure-stream-analytics-.md)   
 [Analytic Functions](../streamAnalyticsQueryLanguage/analytic-functions--azure-stream-analytics-.md)   
 [Array Functions](../streamAnalyticsQueryLanguage/array-functions--stream-analytics-.md)   
 [Conversion Functions](../streamAnalyticsQueryLanguage/conversion-functions--azure-stream-analytics-.md)   
 [Date and Time Functions](../streamAnalyticsQueryLanguage/date-and-time-functions--azure-stream-analytics-.md)   
 [Mathematical Functions](../streamAnalyticsQueryLanguage/mathematical-functions--azure-stream-analytics-.md)   
 [Record Functions](../streamAnalyticsQueryLanguage/record-functions--azure-stream-analytics-.md)   
 [String Functions](../streamAnalyticsQueryLanguage/string-functions--azure-stream-analytics-.md)  
  
  