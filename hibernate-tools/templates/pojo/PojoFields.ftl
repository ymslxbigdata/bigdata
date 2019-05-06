<#-- // Fields -->

<#foreach field in pojo.getAllPropertiesIterator()>
<#if pojo.getMetaAttribAsBool(field, "gen-property", true)> 
<#if pojo.hasMetaAttribute(field, "field-description")>    /**
     ${pojo.getFieldJavaDoc(field, 0)}
     */
 </#if><#foreach column in field.columnIterator><#if column.comment?exists && column.comment?trim?length!=0>   
    /** 
     * ${column.comment}.
     */
     </#if></#foreach>
     <#include "Ejb3FieldAnnotation.ftl"/>
    ${pojo.getFieldModifiers(field)} <#if field.name.equals("id")>Long<#else>${pojo.getJavaTypeName(field, jdk5)}</#if> ${field.name}<#if pojo.hasFieldInitializor(field, jdk5)> = ${pojo.getFieldInitialization(field, jdk5)}</#if>;
    
</#if>
</#foreach>
