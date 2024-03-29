/*
 * generated by Xtext 2.19.0
 */
package org.example.expressions.validation

import org.example.expressions.ExpressionsModelUtil
import org.eclipse.xtext.validation.Check
import org.example.expressions.expressions.VariableRef
import org.example.expressions.expressions.ExpressionsPackage
import com.google.inject.Inject

class ExpressionsValidator extends AbstractExpressionsValidator {
	
	protected static val ISSUE_CODE_PREFIX = "org.example.expressions."
	public static val FORWARD_REFERENCE = ISSUE_CODE_PREFIX + "ForwardReference"
	
	@Inject extension ExpressionsModelUtil
	
	@Check def void checkForwardReference(VariableRef varRef) {
		val variable = varRef.getVariable()
		if (!varRef.isVariableDefinedBefore)
			error(
				"variable forward reference not allowed: '" + variable.name + "'", 
				ExpressionsPackage.eINSTANCE.variableRef_Variable, 
				FORWARD_REFERENCE, 
				variable.name
			)
	}
}
