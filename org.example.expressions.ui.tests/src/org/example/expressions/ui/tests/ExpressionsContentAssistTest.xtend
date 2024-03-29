package org.example.expressions.ui.tests

import org.eclipse.xtext.testing.InjectWith
import org.junit.jupiter.api.Test
import org.eclipse.xtext.ui.testing.AbstractContentAssistTest
import org.eclipse.xtext.testing.XtextRunner
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ExpressionsUiInjectorProvider)
class ExpressionsContentAssistTest extends AbstractContentAssistTest {
	@Test def void testVariableReference() {
		newBuilder.append("var i = 10 eval 1+").assertText('!', '"Value"', '(', '+', '1', 'false', 'i', 'true')
	}

	@Test def void testForwardVariableReference() {
		newBuilder.append("var k = 0 var j=1 eval 1+ var i = 10 ").assertTextAtCursorPosition("+", 1, '!', '"Value"',
			'(', '+', '1', 'false', 'j', 'k', 'true')
	}
}