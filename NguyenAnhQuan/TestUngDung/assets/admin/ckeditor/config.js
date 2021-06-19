/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';

	// The toolbar groups arrangement, optimized for two toolbar rows. 
	//config.extraPlugins = 'syntaxhighlight';
	config.syntaxhighlight_lang = 'csharp';
	config.syntaxhighlight_hideControls = true;
	config.language = 'vi';
	config.filebrowserBrowseUrl = '/assets/admin/ckfinder/ckfinder.html'; 
	config.filebrowserImageBrowseUrl = '/assets/admin/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowseUrl = '/assets/admin/ckfinder.html?Type=Flash'; 
	config.filebrowserUploadurl = '/assets/admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files'; 
	config.filebrowserImageUploadUrl = '/Data'; 
	config.filebrowserFlashUploadUrl = '/assets/admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
	CKFinder.setupCKEditor(null, '/assets/admin/ckfinder');
	CKEDITOR.config.pasteFromWordPromptCleanup = false;
	CKEDITOR.config.pasteFromWordRemoveFontStyles = false;
	CKEDITOR.config.pasteFromWordRemoveStyles = false;
	CKEDITOR.config.language = 'vi';
	CKEDITOR.config.htmlEncodeOutput = false;
	CKEDITOR.config.entities = false
	// CKEDITOR.config.entities = false;
	CKEDITOR.config.entities_latin = false;
	CKEDITOR.config.ForceSimpleAmpersand = true;
	CKEDITOR.config.removePlugins = 'elementspath';
	config.autoParagraph = false;
	//CKEDITOR.replace("txtDescription");
	//config.allowedContent = true;
	
};
