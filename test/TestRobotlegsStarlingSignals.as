/**
 * Created by zan on 05/03/2014.
 */
package
{
import org.flexunit.asserts.assertEquals;

import util.TestClass;

public class TestRobotlegsStarlingSignals
{
    [Test]
    public function test_that_fails():void
    {
       var thisIsFalse:Boolean = false;
       assertEquals("This test fails always!", true, thisIsFalse);
    }

    [Test]
    public function test_that_passes():void
    {
        var thisIsTrue:Boolean = true;
        assertEquals("This test always passes!", true, thisIsTrue);
    }

    [Test]
    public function test_test_class_just_to_see_it_works():void
    {
        var testClass:TestClass = new TestClass();
        testClass.doSomething();
        var shouldBe6 = testClass.doSomethingElse();
        assertEquals(6, shouldBe6);
    }





}
}
