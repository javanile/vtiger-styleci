{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

{strip}
	<div class="container-fluid" id="importModules">
		<div>
			<div class="row">
				<div id="vtlib_modulemanager_import_div">
					{if $MODULEIMPORT_FAILED neq ''}
						<div class="col-lg-2"></div>
						<div class="col-lg-10">
							<b>{vtranslate('LBL_FAILED', $QUALIFIED_MODULE)}</b>
						</div>
						<div class="col-lg-2"></div>
						<div class="col-lg-10">
							{if $VERSION_NOT_SUPPORTED eq 'true'}
								<font color=red><b>{vtranslate('LBL_VERSION_NOT_SUPPORTED', $QUALIFIED_MODULE)}</b></font>
							{else}
								{if $MODULEIMPORT_FILE_INVALID eq "true"}
									<font color=red><b>{vtranslate('LBL_INVALID_FILE', $QUALIFIED_MODULE)}</b></font> {vtranslate('LBL_INVALID_IMPORT_TRY_AGAIN', $QUALIFIED_MODULE)}
								{else}
									<font color=red>{vtranslate('LBL_UNABLE_TO_UPLOAD', $QUALIFIED_MODULE)}</font> {vtranslate('LBL_UNABLE_TO_UPLOAD2', $QUALIFIED_MODULE)}
								{/if}
							{/if}
						</div>
						<input type="hidden" name="view" value="List">
					{else}
						<div class="col-lg-12">
							<div>
								<h3>{vtranslate('LBL_VERIFY_IMPORT_DETAILS',$QUALIFIED_MODULE)}</h3>
							</div><hr>
						</div>
						<div class="container-fluid"><br>
							<div class="col-lg-12">
								<h4>
									{vtranslate($MODULEIMPORT_NAME, $QUALIFIED_MODULE)}
									{if $MODULEIMPORT_EXISTS eq 'true'} <font color=red><b>{vtranslate('LBL_EXISTS', $QUALIFIED_MODULE)}</b></font> {/if}
								</h4>
							</div>
							<div class="col-lg-12">
								<p>
									<small>{vtranslate('LBL_REQ_VTIGER_VERSION', $QUALIFIED_MODULE)} : {$MODULEIMPORT_DEP_VTVERSION}</small>
								</p>
							</div>
							{assign var="need_license_agreement" value="false"}
							{if $MODULEIMPORT_LICENSE}
								{assign var="need_license_agreement" value="true"}
								<div class="col-lg-12">
									<p>{vtranslate('LBL_LICENSE', $QUALIFIED_MODULE)}</p>
								</div>
								<div class="col-lg-12">
									<div style="background: #eee;padding: 20px;box-sizing: border-box;height: 150px;overflow-y: scroll;">
										<p>{$MODULEIMPORT_LICENSE|nl2br}</p>
									</div>
								</div>
							{/if}
							<br>
							<div class="col-lg-12">
								{if $MODULEIMPORT_EXISTS neq 'true'}
									<input type="checkbox" class="acceptLicense"> {vtranslate('LBL_LICENSE_ACCEPT_AGREEMENT', $QUALIFIED_MODULE)}
								{/if}&nbsp;
								<span class="pull-right">
									<div class="row">
										{if $MODULEIMPORT_EXISTS eq 'true' || $MODULEIMPORT_DIR_EXISTS eq 'true'}
											<div class="col-lg-2"></div>
											<div class="col-lg-10">
												{if $MODULEIMPORT_EXISTS eq 'true'}
													<input type="hidden" name="module_import_file" value="{$MODULEIMPORT_FILE}">
													<input type="hidden" name="module_import_type" value="{$MODULEIMPORT_TYPE}">
													<input type="hidden" name="module_import_name" value="{$MODULEIMPORT_NAME}">
												{else}
													<p class="alert-info">{vtranslate('LBL_DELETE_EXIST_DIRECTORY', $QUALIFIED_MODULE)}</p>
												{/if}
											</div>
										{else}
											<input type="hidden" name="module_import_file" value="{$MODULEIMPORT_FILE}">
											<input type="hidden" name="module_import_type" value="{$MODULEIMPORT_TYPE}">
											<input type="hidden" name="module_import_name" value="{$MODULEIMPORT_NAME}">
										{/if}
									</div>
								</span>
							</div>
						</div>
						<br><br>
					{/if}
				</div>
			</div>
		</div>
		<div class="modal-overlay-footer clearfix">
			<div class="row clearfix">
				<div class="textAlignCenter col-lg-12 col-md-12 col-sm-12">
					{if $MODULEIMPORT_FAILED neq ''}
						<button class="btn btn-success finishButton" type="submit"><strong>{vtranslate('LBL_FINISH', $QUALIFIED_MODULE)}</strong></button>
					{else if $MODULEIMPORT_EXISTS eq 'true' || $MODULEIMPORT_DIR_EXISTS eq 'true'}
						<button class="btn btn-success updateModule" name="saveButton">{vtranslate('LBL_UPDATE_NOW', $QUALIFIED_MODULE)}</button>
					{else}
						<button class="btn btn-success importModule" name="saveButton" {if $need_license_agreement eq 'true'} disabled {/if}><strong>{vtranslate('LBL_IMPORT_NOW', $QUALIFIED_MODULE)}</strong></button>
					{/if}
					&nbsp;&nbsp;
					<a class="cancelLink" href="index.php?module=ModuleManager&parent=Settings&view=ModuleImport&mode=importUserModuleStep1">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
				</div>
			</div>
		</div>
	</div>
{/strip}