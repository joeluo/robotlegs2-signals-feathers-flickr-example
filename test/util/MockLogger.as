/**
 * Created by zan on 05/03/2014.
 */
package util
{
import robotlegs.bender.framework.api.ILogger;

public class MockLogger implements ILogger
{

    public function debug( message:*, params:Array = null ):void
    {
    }

    public function info( message:*, params:Array = null ):void
    {
    }

    public function warn( message:*, params:Array = null ):void
    {
    }

    public function error( message:*, params:Array = null ):void
    {
    }

    public function fatal( message:*, params:Array = null ):void
    {
    }
}
}
