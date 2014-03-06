/**
 * Created by zan on 05/03/2014.
 */
package
{
import org.flexunit.asserts.assertEquals;

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






}
}
