import sublime, sublime_plugin

class EthToLanCommand(sublime_plugin.TextCommand):
	def run(self, edit, **args):
		pc = args["pc"]
		dev = args["dev"]
		pos = self.view.sel()[0].begin()
		res = self.view.insert(edit, pos,"\n# "+pc+" configuration\n")
		for i in range(0,dev):
			resutlt = pc+"["+str(i)+"]="+"\"\"\n"
			pos += self.view.insert(edit, pos,resutlt)
