package
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class EndButton extends SimpleButton
	{
		public function EndButton(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}