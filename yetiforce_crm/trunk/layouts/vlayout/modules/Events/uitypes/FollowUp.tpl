{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}
{assign var="dateFormat" value=$USER_MODEL->get('date_format')}
{assign var="currentDate" value=Vtiger_Date_UIType::getDisplayDateValue('')}
{assign var="time" value=Vtiger_Time_UIType::getDisplayTimeValue(null)}
{assign var="currentTimeInVtigerFormat" value=Vtiger_Time_UIType::getTimeValueInAMorPM($time)}
{if $COUNTER eq 2}
</tr><tr class="">
	{assign var=COUNTER value=1}
{else}
	{assign var=COUNTER value=$COUNTER+1}
{/if}
{assign var=FOLLOW_UP_LABEL value={vtranslate('LBL_HOLD_FOLLOWUP_ON',$MODULE)}}
<td class="fieldLabel {if !($SHOW_FOLLOW_UP)}hide {/if}followUpContainer massEditActiveField">
	<label class="muted pull-right marginRight10px">
		<input name="followup" type="checkbox"  onchange="if($(this).prop('checked')){ldelim}changevalidator(this,'validate[funcCall[Vtiger_greaterThanDependentField_Validator_Js.invokeValidation]]'){rdelim}else{ldelim}changevalidator(this,'validate[ required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]'){rdelim}" class="alignTop" {if $FOLLOW_UP_STATUS} checked{/if}/>
		{$FOLLOW_UP_LABEL}
	</label>
	<script>	    
	    function changevalidator(obj,validator){
			$('#quickCreate').validationEngine('hideAll');					
			$('[name="followup_date_start"]').attr('data-validation-engine',validator);
			$('[name="followup_date_start"]').data('validation-engine',validator);
	    }
	</script>

</td>
{$FIELD_INFO['label'] = {$FOLLOW_UP_LABEL}}
<td class="fieldValue {if !($SHOW_FOLLOW_UP)}hide {/if}followUpContainer massEditActiveField">
	<div>
		<div class="input-append row-fluid">
			<div class="span10 row-fluid date">
				<input name="followup_date_start" type="text" class="span9 dateField" data-date-format="{$dateFormat}" type="text"  data-fieldinfo= '{Vtiger_Util_Helper::toSafeHTML(ZEND_JSON::encode($FIELD_INFO))}'
					   value="{if !empty($FOLLOW_UP_DATE)}{$FOLLOW_UP_DATE}{else}{$currentDate}{/if}" data-validation-engine="{if $FOLLOW_UP_STATUS}validate[funcCall[Vtiger_greaterThanDependentField_Validator_Js.invokeValidation]]{else}validate[ required,funcCall[Vtiger_Base_Validator_Js.invokeValidation]]{/if}" />
				<span class="add-on"><i class="icon-calendar"></i></span>
			</div>	
		</div>		
	</div>
	<div>
		<div class="input-append time">		    
			<input type="text" name="followup_time_start" class="timepicker-default input-small" 
				   value="{if !empty($FOLLOW_UP_TIME)}{$FOLLOW_UP_TIME}{else}{$currentTimeInVtigerFormat}{/if}" />
			<span class="add-on cursorPointer">
				<i class="icon-time"></i>
			</span>
		</div>	
	</div>
</td>
<td></td><td></td>