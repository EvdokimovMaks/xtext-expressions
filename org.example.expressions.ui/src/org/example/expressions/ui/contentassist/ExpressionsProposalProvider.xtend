/*
 * generated by Xtext 2.19.0
 */
package org.example.expressions.ui.contentassist

import com.google.inject.Inject
import org.example.expressions.ExpressionsModelUtil
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor
import org.eclipse.xtext.Assignment
import org.eclipse.emf.ecore.EObject
import org.example.expressions.expressions.Expression
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext

/**
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#content-assist
 * on how to customize the content assistant.
 */
class ExpressionsProposalProvider extends AbstractExpressionsProposalProvider {
	
	@Inject extension ExpressionsModelUtil 
	
	override completeAtomic_Variable(EObject elem, 
		Assignment assignment, 
		ContentAssistContext context, 
		ICompletionProposalAcceptor acceptor) 
	{
		if (elem instanceof Expression)
			elem.variablesDefinedBefore.forEach[
				variable |
				acceptor.accept(createCompletionProposal(variable.name, variable.name + " - Variable", null, context))
			]
	}
}
