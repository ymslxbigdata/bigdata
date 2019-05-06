${pojo.getPackageDeclaration()}

<#assign classbody>
import jp.co.yamaha_motor.yna2.audit.function.FunctionAuditable;
import jp.co.yamaha_motor.yna2.audit.Auditable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;
import org.hibernate.annotations.Type;
<#include "PojoTypeDeclaration.ftl"/>, Auditable, FunctionAuditable, Identity<Long> {
    private static final long serialVersionUID = 1L;

<#if !pojo.isInterface()>
<#include "PojoFields.ftl"/>

<#include "PojoConstructors.ftl"/>
   
<#include "PojoPropertyAccessors.ftl"/>

<#include "PojoToString.ftl"/>

<#include "PojoEqualsHashcode.ftl"/>

<#else>
<#include "PojoInterfacePropertyAccessors.ftl"/>

</#if>
<#include "PojoExtraClassCode.ftl"/>

}
</#assign>

${pojo.generateImports()}
${classbody}

