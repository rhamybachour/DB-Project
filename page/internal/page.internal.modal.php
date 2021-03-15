<!-- JOIN MODAL -->
<a href="#modal-join" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-join' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-join" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the columns of Join</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class='col-lg-12'>
                        <label for='input-label'>Choose a first column</label>
                        <select class='form-control m-bot15' id='select-join-first' onchange='clientJoinModal(this)'>
                            <option class='option-join-first' value=''>Choose a column</option>
                        </select>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-lg-2'>
                        <label for='input-label'>Operator</label>
                        <select class='form-control m-bot15' disabled id='select-join-opt' onchange='clientJoinModal(this)'>
                            <option class='option-join-opt' value=''></option>
                            <option class='option-join-opt' value='='>=</option>
                            <option class='option-join-opt' value='<'><</option>
                            <option class='option-join-opt' value='>'>></option>
                            <option class='option-join-opt' value='<='><=</option>
                            <option class='option-join-opt' value='>='>>=</option>
                            <option class='option-join-opt' value='<>'><></option>
                        </select>
                    </div>
                    <div class='col-lg-5'>
                        <label for='input-label'>Choose a second column</label>
                        <select class='form-control m-bot15' disabled id='select-join-modal' onchange='clientJoinModal(this)'>
                            <option class='option-join-on' value=''>Choose a column</option>
                        </select>
                    </div>
                    <div class='col-lg-5'>
                        <label for='input-label'>Write a condition</label>
                        <input type='text' id='input-join' disabled class='form-control m-bot15' onkeyup='clientJoinModal(this)'/>
                    </div>
                </div>
                <button id='button-join-confirm' class="btn btn-success" onclick='clientJoinButton(this)' style='display: none;' type="button">Confirm</button>
                <button id='button-join-andor' class="btn btn-success" onclick='clientJoinButton(this)' style='display: none;' type="button">+</button>
                <button data-dismiss="modal" id='button-join-close' class="btn btn-default" onclick='clientJoinButton(this)' style='display: none;' type="button">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- ORDER MODAL -->
<a href="#modal-order" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-order' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-order" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the type of Sort</h4>
            </div>
            <div class="modal-body">
                <label for='input-label'>Column</label>
                <select class='form-control m-bot15' id='select-on-order' onchange='clientOrder(this)'>
                    <option class='option-on-order' value=''>Choose a column</option>
                    <option class='option-on-order' value='ASC'>ASC</option>
                    <option class='option-on-order' value='DESC'>DESC</option>
                </select>
                <button data-dismiss="modal" id='button-modal-order' class="btn btn-default" style='display: none;' type="button">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- FUNCTION MODAL -->
<a href="#modal-func" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-func' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-func" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the column of Function</h4>
            </div>
            <div class="modal-body">
                <label for='input-label'>Column</label>
                <select class='form-control m-bot15' id='select-on-func' onchange='clientFunctionButton(this)'>
                    <option class='option-on-func' value=''>Choose a column</option>
                </select>
                <button data-dismiss="modal" id='button-modal-func' class="btn btn-default" style='display: none;' type="button">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- SET MODAL -->
<a href="#modal-set" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-set' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-set" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the columns of Where</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-12'>
                        <label for='input-label'>Write a condition</label>
                        <input type='text' id='input-set' class='form-control m-bot15' onkeyup='clientSetModal()'/>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-set' onclick='clientSet(this)' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>
<!-- WHERE MODAL -->
<a href="#modal-where" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-where' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-where" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the columns of Where</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-2'>
                        <label for='input-label'>Operator</label>
                        <select class='form-control m-bot15' id='select-where-opt' onchange='clientWhereModal(this)'>
                            <option class='option-where-opt' value=''></option>
                            <option class='option-where-opt' value='='>=</option>
                            <option class='option-where-opt' value='<'><</option>
                            <option class='option-where-opt' value='>'>></option>
                            <option class='option-where-opt' value='<='><=</option>
                            <option class='option-where-opt' value='>='>>=</option>
                            <option class='option-where-opt' value='<>'><></option>
                        </select>
                    </div>
                    <div class='col-lg-5'>
                        <label for='input-label'>Choose a column</label>
                        <select class='form-control m-bot15' disabled id='select-where-modal' onchange='clientWhereModal(this)'>
                            <option class='option-join-on' value=''>Choose a column</option>
                        </select>
                    </div>
                    <div class='col-lg-5'>
                        <label for='input-label'>Write a condition</label>
                        <input type='text' id='input-where' disabled class='form-control m-bot15' onkeyup='clientWhereModal(this)'/>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-where' onclick='clientWhere(this)' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>
<!-- HAVING MODAL -->
<a href="#modal-having" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-having' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-having" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose condition of Having</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-2'>
                        <label for='input-label'>Operator</label>
                        <select class='form-control m-bot15' id='select-having-opt' onchange='clientHavingModal(this)'>
                            <option class='option-having-opt' value=''></option>
                            <option class='option-having-opt' value='='>=</option>
                            <option class='option-having-opt' value='<'><</option>
                            <option class='option-having-opt' value='>'>></option>
                            <option class='option-having-opt' value='<='><=</option>
                            <option class='option-having-opt' value='>='>>=</option>
                            <option class='option-having-opt' value='<>'><></option>
                            <option class='option-having-opt' value='between'>between</option>
                        </select>
                    </div>
                    <div class='col-lg-5'>
                        <label for='input-label'>Write a condition</label>
                        <input type='text' id='input-having' disabled class='form-control m-bot15' onkeyup='clientHavingModal(this)'/>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-having' onclick='clientHaving()' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>
<!-- WHERE AND-OR MODAL -->
<a href="#modal-andor" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-andor' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-andor" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the Option for Concatenation</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-12'>
                        <label for='input-label'>Condition</label>
                        <select class='form-control m-bot15' id='select-andor-opt' onchange='clientAndorModal(this)'>
                            <option class='option-andor-opt' value=''>Choose a Option</option>
                            <option class='option-andor-opt' value='AND'>AND</option>
                            <option class='option-where-opt' value='OR'>OR</option>
                        </select>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-andor' onclick='clientAndorButton()' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>
<!-- JOIN AND-OR MODAL -->
<a href="#modal-andor-join" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-andor-join' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-andor-join" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the Option for Concatenation</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-12'>
                        <label for='input-label'>Condition</label>
                        <select class='form-control m-bot15' id='select-andor-opt-join' onchange='clientJoinAndor(this)'>
                            <option class='option-andor-opt' value=''>Choose a Option</option>
                            <option class='option-andor-opt' value='AND'>AND</option>
                            <option class='option-where-opt' value='OR'>OR</option>
                        </select>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-andor-join' onclick='' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>
<!-- SELECT AND-OR MODAL -->
<a href="#modal-select" data-toggle="modal" data-backdrop="static" data-keyboard="false" id='a-select' style='display: none;'></a>
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="modal-select" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Choose the Option Select</h4>
            </div>
            <div class="modal-body">
                <div class='row'>
                    <div class='col-lg-12'>
                        <label for='input-label'>Condition</label>
                        <select class='form-control m-bot15' id='select-andor-opt-join' onchange='clientSelectOption(this)'>
                            <option class='option-andor-opt' value=''>Choose a Option</option>
                            <option class='option-andor-opt' value=''>ALL</option>
                            <option class='option-where-opt' value='DISTINCT'>DISTINCT</option>
                        </select>
                    </div>
                </div>
                <button data-dismiss="modal" id='button-modal-select' type='submit' onclick='clientSqlSelect()' class="btn btn-default" type="button" style='display: none;'>Close</button>
            </div>
        </div>
    </div>
</div>