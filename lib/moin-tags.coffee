{CompositeDisposable} = require 'atom'

module.exports = MoinCodeBrackets =
    subscriptions: null

    activate: ->
        @subscriptions = new CompositeDisposable
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:italica': => @wrapit("''", "''")
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:bold': => @wrapit("'''", "'''")
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:underline': => @wrapit('__', '__')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:stroke': => @wrapit('--(', ')--')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:smaller': => @wrapit('~-', '-~')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:larger': => @wrapit('~+', '+~')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:superscript': => @wrapit('^', '^')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:subscript': => @wrapit(',,', ',,')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:monospace': => @wrapit('`', '`')
        @subscriptions.add atom.commands.add 'atom-workspace', 'moin-tags:code': => @wrapit('{{{', '}}}')

    deactivate: ->
        @subscriptions.dispose()

    wrapit: (open, close) ->
        if editor = atom.workspace.getActiveTextEditor()
            selection = editor.getSelectedText()

            if selection.length > 0
                editor.insertText("#{open}#{selection}#{close}")
