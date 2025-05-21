local test = {
	test_notif = function(cutscene, event)
		local function notification(text, name)
			local ps_command = 'powershell -ExecutionPolicy Bypass -Command "[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null; $template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02); $textNodes = $template.GetElementsByTagName(\'text\'); $textNodes.Item(0).AppendChild($template.CreateTextNode(\''..name..'\')) | Out-Null; $textNodes.Item(1).AppendChild($template.CreateTextNode(\''..text..'\')) | Out-Null; $toast = [Windows.UI.Notifications.ToastNotification]::new($template); $notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier(\'DarkPlaceRebirth\'); $notifier.Show($toast);"'

			print("Running command:")
			print(ps_command)
			os.execute(ps_command)
		end
		
		notification("Are you happy I''m not an obessed freak?", "BUP")
    end,
}
return test
