class shapes3 : AlignWidget, EventReceiver
{
	SingleChangerWidget s;
	VBoxWidget r;
	AlignWidget app;
	VBoxWidget vb;
	

	public static shapes3 create(AlignWidget app) {
		var v = new shapes3();
		v.app = app;
		return(v);	
	}

	public override void initialize() {
		base.initialize();
	
		add_align(-1, 1, vb = VBoxWidget.instance());
		set_background(ImageWidget.for_icon("bg2"));
		add_align(0.35, -0.55, ImageButtonWidget.instance().set_image(Image.resize(Image.icon("circle"),80,60)).set_event("cir"));
		add_align(-0.35, -0.55, ImageButtonWidget.instance().set_image(Image.resize(Image.icon("heart"),57,57)).set_event("hrt"));
		add_align(0, -0.55, ImageButtonWidget.instance().set_image(Image.resize(Image.icon("rectangle"),57,56)).set_event("rec"));
	
		add_align(0.58, -0.60, LabelWidget.instance().set_text("CIRCLE").set_color(Color.instance("#000000")));
		add_align(-0.58, -0.60, LabelWidget.instance().set_text("HEART").set_color(Color.instance("#000000")));
		add_align(0, -0.64, LabelWidget.instance().set_text("RECTANGLE").set_color(Color.instance("#000000")));
		add_align(0, 0, ImageButtonWidget.instance().set_image(Image.resize(Image.icon("circle"),57,56))); //CORRECT!
		vb.add_vbox(0, ButtonWidget.instance().set_text("Back").set_event("back"));
		
	}		
	public void on_event(Object o) {
	if(o!=null)
	{
		if(o is String)
			{
				var i = o as String;
				if(i.equals("back"))
				{
					s.show(this, menuWidget.create(AlignWidget.instance()), CrossFadeTransition.instance());
				}
				//CORRECT!
				else if(i.equals("hrt"))
				{
					IFDEF("target_android") {
						AudioPlayer.play(AudioClip.for_resource("sorry"));
					}
					Popup.widget(get_engine(),DialogWidget.message("You clicked the wrong shape!","Oh no!", null));
				}
				else if(i.equals("rec"))
				{
					IFDEF("target_android") {
						AudioPlayer.play(AudioClip.for_resource("sorry"));
					}
					Popup.widget(get_engine(),DialogWidget.message("You clicked the wrong shape!","Oh no!", null));
				}
				else if(i.equals("cir"))
				{
					IFDEF("target_android") {
						AudioPlayer.play(AudioClip.for_resource("nice"));
					}
					Popup.widget(get_engine(),DialogWidget.message("You completed all the exercises!","Congratulations!", "okay2",true).set_listener(this));
				}
				else if(i.equals("okay2")) {
					s.show(this, congrats.create(AlignWidget.instance()), CrossFadeTransition.instance());			
				}	
			}
		}	
	}
}	

