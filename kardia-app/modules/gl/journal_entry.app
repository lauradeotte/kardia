$Version=2$
journal_entry "widget/page"
    {
    title = "GL Journal Entry";
    width=800; height=600;

    ledger "widget/parameter" { type=string; default=null; allowchars="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; }
    batch "widget/parameter" { type=integer; default=null; }

    widget_template = "/apps/kardia/tpl/kardia-system.tpl", runserver("/apps/kardia/tpl/" + user_name() + ".tpl");

    require_one_endorsement="kardia:gl_manage","kardia:gl_entry";
    endorsement_context=runserver("kardia:ledger:" + :this:ledger + ":");

    background="/apps/kardia/images/bg/light_bgnd.jpg";

    glj_cmp "widget/component"
	{
	condition = runserver(not (:this:ledger is null));
	path = "/apps/kardia/modules/gl/journal_entry.cmp";
	ledger = runserver(:this:ledger);
	batch = runserver(:this:batch);
	}
    }
