/**
 * Created by zan on 05/03/2014.
 */
package util
{
public class TestClass    implements ITestClass
{
    [Inject]
    public var foo:Number;

    public function TestClass()
    {
    }

    public function doSomething():void
    {
        trace("doSomething");
    }

    public function doSomethingElse():int
    {
        return foo;
    }
}
}
