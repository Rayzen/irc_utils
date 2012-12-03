import sublime, sublime_plugin
import datetime


class AddTimeStampCommand(sublime_plugin.TextCommand):
    def run(self, edit):
    	now = datetime.datetime.now()
    	# return standard SOA formatted serial for today
    	date = now.strftime("%Y%m%d00")
    	self.view.insert(edit,self.view.sel()[0].begin(),date)
