---
title: "Time Management (Azure Stream Analytics)"
ms.custom: na
ms.date: "2016-05-18"
ms.prod: "azure"
ms.reviewer: na
ms.service: "stream-analytics"
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: "reference"
applies_to: 
  - "Azure"
ms.assetid: 1cc875d1-0f20-46b6-8001-dad1eaa075e5
caps.latest.revision: 15
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
# Time Management (Azure Stream Analytics)
  Azure Stream Analytics query language extends SQL syntax to enable complex computations over streams of events. Stream Analytics provides language constructs to deal with the temporal aspects of the data. For example, it is possible to assign custom timestamps to the stream events, specify time window for aggregations, specify allowed time difference between two streams of data for JOIN operation, etc.  
  
|Item|Summary|  
|----------|-------------|  
|[System.Timestamp](../streamAnalyticsQueryLanguage/system.timestamp---stream-analytics-.md)|System.Timestamp is a system property that can be used to retrieve the event’s timestamp.|  
|[TIMESTAMP BY](../streamAnalyticsQueryLanguage/timestamp-by--azure-stream-analytics-.md)|The TIMESTAMP BY clause allows specifying custom timestamp values.|  
|[Time Skew Policies](../streamAnalyticsQueryLanguage/time-skew-policies--azure-stream-analytics-.md)|Policies for Out of Order and Late Arrival Events.|  
|[Aggregate functions](../streamAnalyticsQueryLanguage/aggregate-functions--azure-stream-analytics-.md) over [time window](../streamAnalyticsQueryLanguage/windowing--azure-stream-analytics-.md)|Aggregate functions are used to perform a calculation on a set of values from a time window and return a single value.|  
|[DATEDIFF in JOIN predicate](../streamAnalyticsQueryLanguage/join--azure-stream-analytics-.md)|Specify time boundaries for JOIN operations|  
|[Date and Time functions](../streamAnalyticsQueryLanguage/date-and-time-functions--azure-stream-analytics-.md)|Stream Analytics provides a variety of date and time functions for use.|  
  
## See Also  
 [Built-in Functions &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/built-in-functions--azure-stream-analytics-.md)   
 [Data Types &#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/data-types--azure-stream-analytics-.md)   
 [Event Delivery Guarantees&#40;Azure Stream Analytics&#41;](../streamAnalyticsQueryLanguage/event-delivery-guarantees--azure-stream-analytics-.md)  
  
  