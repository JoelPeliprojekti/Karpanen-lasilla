package
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class OkButton extends SimpleButton
	{
		public function OkButton(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}