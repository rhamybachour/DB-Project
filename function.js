//GLOBAL VARIABLES
var option = "";
var choice = "";
var mode = "";
var limit = 0;
var list_where = [];
var list_set = [];
var list_table = [];
var list_column = [];
var list_group = [];
var list_join = [];
var list_func = [];
var list_having = [];
var child = [];
var dict_join = [];
var var_select = "";
var var_order = "";

//GLOBAL VARIABLES OF PAGE INSERT.PHP
var insert_div_input = document.getElementById('div-input');
var insert_section = document.getElementById('section-insert');
var insert_input = document.getElementsByClassName('input-insert');

//GLOBAL VARIABLES OF PAGE DELETE.PHP
var delete_section = document.getElementById('section-delete');
var delete_input_where = document.getElementById('input-where');
var delete_div_select = document.getElementById('div-select');
var delete_div_where = document.getElementById('div-where');
var delete_select_where_opt = document.getElementById('select-where-opt');
var delete_select_modal_where = document.getElementById('select-where-modal');
var delete_select_table = document.getElementById('select-table');
var delete_select_where = document.getElementById('select-where');
var delete_select_andor = document.getElementById('select-andor-opt');
var delete_a_where = document.getElementById('a-where');
var delete_a_andor = document.getElementById('a-andor');

//GLOBAL VARIABLES OF PAGE UPDATE.PHP
var update_section_button = document.getElementById('section-button');
var update_input_set = document.getElementById('input-set');
var update_input_where = document.getElementById('input-where');
var update_div_select = document.getElementById('div-select');
var update_div_set = document.getElementById('div-set');
var update_div_where = document.getElementById('div-where');
var update_select_where_opt = document.getElementById('select-where-opt');
var update_select_where_modal = document.getElementById('select-where-modal');
var update_select_table = document.getElementById('select-table');
var update_select_set = document.getElementById('select-set');
var update_select_where = document.getElementById('select-where');
var update_select_andor = document.getElementById('select-andor-opt');
var update_a_set = document.getElementById('a-set');
var update_a_where = document.getElementById('a-where');
var update_a_andor = document.getElementById('a-andor');
var update_modal_button = document.getElementById('button-modal-set');

//GLOBAL VARIABLES OF PAGE INSERT.PHP
var select_section_button = document.getElementById('section-button');

var select_div_table = document.getElementById('div-select');
var select_div_join = document.getElementById('div-join');
var select_div_group = document.getElementById('div-group');
var select_div_column = document.getElementById('div-column');
var select_div_where = document.getElementById('div-where');
var select_div_having = document.getElementById('div-having');
var select_div_order = document.getElementById('div-order');
var select_div_func = document.getElementById('div-func');

var select_select_table = document.getElementById('select-table');
var select_select_column = document.getElementById('select-column');
var select_select_group = document.getElementById('select-group');
var select_select_join = document.getElementById('select-join');
var select_select_where = document.getElementById('select-where');
var select_select_having = document.getElementById('select-having');
var select_select_order = document.getElementById('select-order');
var select_select_func = document.getElementById('select-func');

var select_modal_select_where = document.getElementById('select-where-modal');
var select_modal_select_andor = document.getElementById('select-andor-opt');
var select_modal_input_where = document.getElementById('input-where');
var select_modal_input_having = document.getElementById('input-having');
var select_modal_opt_where = document.getElementById('select-where-opt');
var select_modal_opt_having = document.getElementById('select-having-opt');
var select_modal_button_where = document.getElementById('button-modal-where');
var select_modal_button_having = document.getElementById('button-modal-having');
var select_modal_select_func = document.getElementById('select-on-func');
var select_modal_button_order = document.getElementById('button-modal-order');
var select_modal_button_func = document.getElementById('button-modal-func');
var select_modal_opt_andor_join = document.getElementById('select-andor-opt-join');
var select_modal_button_andor_join = document.getElementById('button-join-andor');
var select_modal_button_close_join = document.getElementById('button-join-close');
var select_modal_button_confirm_join = document.getElementById('button-join-confirm');
var select_modal_button_andor = document.getElementById('button-modal-andor-join');
var select_modal_button_andor_where = document.getElementById('button-modal-andor');
var select_modal_button_select = document.getElementById('button-modal-select');
var select_modal_input_join = document.getElementById('input-join');
var select_modal_select1_join = document.getElementById('select-join-first');
var select_modal_select2_join = document.getElementById('select-join-modal');
var select_modal_opt_join = document.getElementById('select-join-opt');

var select_a_join = document.getElementById('a-join');
var select_a_where = document.getElementById('a-where');
var select_a_having = document.getElementById('a-having');
var select_a_andor = document.getElementById('a-andor');
var select_a_order = document.getElementById('a-order');
var select_a_func = document.getElementById('a-func');
var select_a_andor_join = document.getElementById('a-andor-join');
var select_a_select = document.getElementById('a-select');

var select_execute = document.getElementById('executar');
var select_confirm = document.getElementById('confirmar');

function clientSchemaInsert(obj) {
    //CLEAN THE VARIABLE
    var i = 0;
    //DEFINE VARIABLE
    window.mode = "insert";
    window.list_table = [];
    //FILL TAGS AND SEARCH THE SELECTED CHILD
    for (i = 1; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            window.list_table.push(obj.childNodes[i].value);
            insert_div_input.innerHTML = clientInsertInput(clientDictionary(obj.childNodes[i].value, 'all'));
            insert_section.style.display = "inline";
        }
    }
}

function clientSchemaDelete(obj) {
    //CLEAN THE VARIABLE
    var i = 0;
    //DEFINE VARIABLE
    window.mode = "delete";
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-table') {
        //CLEAN VARIABLE FOR EACH TABLE CHOSEN
        window.list_table = [];
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF TABLE WHICH WAS TABLE CHOSEN
                window.list_table.push(obj.childNodes[i].value);
                //FILL AND RESIZE THE WHERE'S SELECT
                delete_select_where.innerHTML = "<option class='option-where' value=''>Choose a column</option>";
                delete_select_where.innerHTML += clientWhereSelect(obj.childNodes[i].value);
                delete_div_select.className = "col-lg-6";
                //SHOW THE WHERE'S SELECT AND BUTTON'S SECTION
                delete_section.style.display = "inline";
                delete_div_where.style.display = "inline";
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-where') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //TEST IF IS THE FIRST COLUMN OF WHERE
                if (window.list_where.length == 0) {
                    //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
                    window.list_where.push(obj.childNodes[i].value);
                    //OPEN THE WHERE'S MODAL TO CONTINUE
                    delete_a_where.click();
                    //FILL THE MODAL'S SELECT WITH WHERE'S CHILD
                    delete_select_modal_where.innerHTML = obj.innerHTML;
                } else {
                    //QUESTION BEFORE OPEN THE WHERE'S MODAL
                    delete_a_andor.click();
                    delete_select_andor.childNodes[1].selected = true;
                }
            }
            //LOCK THE TABLE'S SELECT
            delete_select_table.disabled = true;
            //DISABLE THE OTHER OPTION OF WHERE'S MODAL
            delete_select_where_opt.disabled = false;
            delete_input_where.disabled = true;
        }
    }
}

function clientSchemaUpdate(obj) {
    //CLEAN THE VARIABLE
    var i = 0;
    //DEFINE VARIABLE
    window.mode = "update";
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-table') {
        //CLEAN VARIABLE FOR EACH TABLE CHOSEN
        window.list_table = [];
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF TABLE WHICH WAS CHOSEN TABLE
                window.list_table.push(obj.childNodes[i].value);
                //FILL AND RESIZE THE SET'S SELECT AND THE WHERE'S SELECT 
                update_select_set.innerHTML = "<option class='option-set' value=''>Choose a column</option>";
                update_select_where.innerHTML = "<option class='option-where' value=''>Choose a column</option>";
                update_select_set.innerHTML += clientSetSelect(obj.childNodes[i].value);
                update_select_where.innerHTML += clientWhereSelect(obj.childNodes[i].value);
                update_div_select.className = "col-lg-4";
                //SHOW THE SET'S SELECT AND WHERE'S SELECT
                update_div_where.style.display = "inline";
                update_div_set.style.display = "inline";
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-set') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF SET WHICH WAS COLUMN CHOSEN
                window.list_set.push(obj.childNodes[i].value);
                //CLEAN AND CONFIGURE THE SET'S MODAL
                update_input_set.value = "";
                update_input_set.placeholder = "TYPE: " + clientDictionary(window.list_table[0], obj.childNodes[i].value);
                //REMOVE THE SELECTED CHILD AND OPEN THE SET'S MODAL
                obj.removeChild(obj.childNodes[i]);
                update_a_set.click();
                //SHOW THE BUTTON'S SECTION AND LOCK THE TABLE'S SELECT
                update_section_button.style.display = "inline";
                update_select_table.disabled = true;
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-where') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                if (window.list_where.length == 0) {
                    //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
                    window.list_where.push(obj.childNodes[i].value);
                    //OPEN THE WHERE'S MODAL AND FILL THE MODAL'S SELECT
                    update_a_where.click();
                    update_select_where_modal.innerHTML = obj.innerHTML;
                } else {
                    //QUESTION BEFORE OPEN THE WHERE'S MODAL
                    update_a_andor.click();
                    update_select_andor.childNodes[1].selected = true;
                }
            }
            //LOCK THE TABLE'S SELECT
            update_select_table.disabled = true;
            //DISABLE THE OTHER OPTION OF WHERE'S MODAL
            update_select_where_opt.disabled = false;
            update_input_where.disabled = true;
        }
    }
}

function clientSchemaSelect(obj) {
    //DEFINE VARIABLES
    var i = 0;
    var html_group = "";
    var html_column = "";
    var html_where = "";
    var html_order = "";
    //DEFINE VARIABLE
    window.mode = "select";
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == "select-table") {
        //DEFINES START OF VARIABLES
        html_group += "<option class='option-group' value=''>Choose a column</option>";
        html_column += "<option class='option-column' value=''>Choose a column</option>";
        html_column += "<option class='option-column' value='*'>All columns</option>";
        html_where += "<option class='option-where' value=''>Choose a column</option>";
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //CHECK IF JOIN WAS CHOSEN
                if (window.list_table.length >= 1 && window.list_join.length != 0) {
                    window.list_join[window.list_join.length - 1] += " " + obj.childNodes[i].value + " on";
                }
                //PUT IN LIST OF TABLE WHICH WAS COLUMN CHOSEN AND REMOVE THE SELECTED CHILD
                window.list_table.push(obj.childNodes[i].value);
                obj.removeChild(obj.childNodes[i]);
                //REDEFINES CLASS AND DISABLES JOIN'S SELECT
                select_select_join.disabled = false;
                select_div_table.className = "col-lg-3";
            }
        }
        //CHECK IF IS THE FIRST SELECTED TABLE
        if (window.list_table.length > 1) {
            //VERIFY THE LENGTH OF JOIN'S LIST
            if (window.list_join.length == 0) {
                select_select_join.disabled = true;
            } else {
                //FILL THE TAG OF JOIN'S MODAL AND OPEN IT
                clientJoin();
                select_a_join.click();
                select_modal_select1_join.disabled = false;
                //DISABLES SPECIFIC TAGS
                select_select_func.disabled = false;
                select_select_join.disabled = false;
                select_select_where.disabled = false;
                //CHECK IF THE SELECTED COLUMN IS 'ALL' 
                if (window.list_column[0] != '*') {
                    select_select_group.disabled = false;
                    select_select_column.disabled = false;
                    select_select_having.disabled = false;
                }
            }
        }
        //FILL THE COLUMN'S AND WHERE'S TAG
        for (i = 0; i < window.list_table.length; i++) {
            html_column += clientColumn(window.list_table[i]);
            html_where += clientWhereOption(window.list_table[i]);
        }
        select_select_column.innerHTML = html_column;
        select_select_where.innerHTML = html_where;
        //SET DISPLAY ON PAGE SOME TAGS
        select_div_join.style.display = "inline";
        select_div_column.style.display = "inline";
        select_div_where.style.display = "inline";
        select_div_func.style.display = "inline";
        //DISABLES OBJECT IF HE IS EMPTY
        if (obj.childElementCount == 1) {
            obj.disabled = true;
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == "select-column") {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            //AND CHECK IF THE USER SELECTS 'ALL' COLUMN
            if (obj.childNodes[i].selected && obj.childNodes[i].value == '*') {
                //DISABLE AND RESTART THE OBJECT
                obj.firstChild.selected = true;
                obj.disabled = true;
                //SET DISPLAY OF TAGS
                select_div_order.style.display = "inline";
                select_div_func.style.display = "none";
                //FILL THE ORDER'S TAG
                html_order += "<option class='option-order' value=''>Choose a column</option>";
                html_order += clientOrderSelect();
                select_select_order.innerHTML = html_order;
                //ENABLES AND DISABLES SOME TAGS
                select_select_func.disabled = true;
                select_select_order.disabled = false;
                select_select_table.disabled = true;
                select_select_join.disabled = true;
                select_select_func.disabled = true;
                //PUT IN LIST OF COLUMN WHICH WAS COLUMN CHOSEN
                window.list_column.push(obj.childNodes[i].value);
            } else {
                if (obj.childNodes[i].selected) {
                    //CHECK IF THE LIST OF FUNCTION IS EMPTY
                    if (window.list_func.length == 0) {
                        select_div_group.style.display = "inline";
                    }
                    //SET DISPLAY OF TAG
                    select_div_order.style.display = "inline";
                    //ENABLES AND DISABLES SOME TAGS
                    select_select_order.disabled = false;
                    select_select_func.disabled = true;
                    select_select_group.disabled = false;
                    //FILL THE ORDER'S TAG
                    html_order += "<option class='option-order' value='" + obj.childNodes[i].value + "'>" + obj.childNodes[i].value + "</option>";
                    select_select_order.innerHTML += html_order;
                    select_select_group.innerHTML += "<option class='option-group' value='" + obj.childNodes[i].value + "'>" + obj.childNodes[i].value + "</option>";
                    //PUT IN LIST OF COLUMN WHICH WAS COLUMN CHOSEN AND REMOVE THE SELECTED CHILD
                    window.list_column.push(obj.childNodes[i].value);
                    obj.removeChild(obj.childNodes[i]);
                    //REMOVE THE FIRST COLUMN IF HE NOT WAS CHOSEN FIRST
                    if (obj.childNodes[1].value == '*') {
                        obj.removeChild(obj.childNodes[1]);
                    }
                }
            }
        }
        //ENABLES AND DISABLES SOME TAGS
        select_select_table.disabled = true;
        select_select_join.disabled = true;
        //DISABLES OBJECT IF HE IS EMPTY
        if (obj.childElementCount == 1) {
            obj.disabled = true;
        }
        //SET DISPLAY OF TAG
        select_section_button.style.display = "inline";
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-group') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF COLUMN AND GROUP WHICH WAS COLUMN CHOSEN AND REMOVE THE SELECTED CHILD
                window.list_group.push(obj.childNodes[i].value);
                window.list_column.push(obj.childNodes[i].value);
                obj.removeChild(obj.childNodes[i]);
            }
        }
        //ENABLES AND DISABLES SOME TAGS
        select_select_func.disabled = false;
        select_select_column.disabled = true;
        //CHECK IF ORDER WAS DEFINED
        if (window.var_order == "") {
            select_div_order.style.display = "inline";
        }
        //DISABLES OBJECT IF HE IS EMPTY
        if (obj.childElementCount == 1) {
            obj.disabled = true;
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-order') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF COLUMN AND GROUP WHICH WAS COLUMN CHOSEN
                window.var_order = obj.childNodes[i].value;
                obj.removeChild(obj.childNodes[i]);
                //DISABLE OBJECT AND OPEN ORDER'S MODAL
                obj.disabled = true;
                select_a_order.click();
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-func') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF COLUMN WHICH WAS COLUMN CHOSEN
                window.list_func.push(obj.childNodes[i].value);
                //CHECK IF COLUMN WAS CHOSEN
                if (window.list_column.length == 0) {
                    //CHECK IF SELECTED COLUMN IS 'COUNT'
                    if (obj.childNodes[i].value == 'count') {
                        select_modal_select_func.innerHTML += "<option class='option-on-func' value='*'>All Columns</option>";
                    }
                    //FILL THE TAG OF FUNCTION'S MODAL
                    for (i = 0; i < window.list_table.length; i++) {
                        var list = clientDictionary(window.list_table[i], 'all');
                        for (j = 0; j < list.length; j++) {
                            select_modal_select_func.innerHTML += "<option class='option-on-func' value='" + window.list_table[i] + "." + list[j].key + "'>" + window.list_table[i] + "." + list[j].key + "</option>";
                        }
                    }
                    //DISABLES THE OBJECT
                    obj.disabled = true;
                } else {
                    //TEST, FILL AND REMOVE SOME CHILD OF FUNCTION'S MODAL
                    if (select_modal_select_func.childElementCount == 1) {
                        if (obj.childNodes[i].value == 'count') {
                            select_modal_select_func.innerHTML += "<option class='option-on-func' value='*'>All Columns</option>";
                            select_modal_select_func.innerHTML += select_select_column.innerHTML;
                            select_modal_select_func.removeChild(select_modal_select_func.childNodes[4]);
                        } else {
                            select_modal_select_func.innerHTML += select_select_column.innerHTML;
                            select_modal_select_func.removeChild(select_modal_select_func.childNodes[3]);
                        }
                    }

                }
                //OPEN THE FUNCTION'S MODAL
                select_a_func.click();
                //ENABLES AND DISABLES SOME TAGS
                select_select_column.disabled = true;
                select_select_table.disabled = true;
                select_select_join.disabled = true;
                select_modal_select_func.disabled = false;
                //SELECT THE FIRST CHILD
                obj.childNodes[1].selected = true;
                //SET DISPLAY AND DISABLES SOME TAGS IF GROUP'S LIST IS NOT EMPTY
                if (window.list_group.length != 0) {
                    select_select_having.disabled = false;
                    select_div_having.style.display = "inline";
                }
            }
        }
        //SET DISPLAY OF TAG
        select_section_button.style.display = "inline";
    }

    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-where') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //ENABLES AND DISABLES SOME TAGS
                select_modal_opt_where.disabled = false;
                select_modal_input_where.disabled = true;
                //SET DISPLAY OF TAG
                select_modal_button_where.style.display = "none";
                //CHECK IF WHERE'S LIST IS EMPTY
                if (window.list_where.length == 0) {
                    //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN, OPEN THE WHERE'S MODAL AND FILL IT
                    window.list_where.push(obj.childNodes[i].value);
                    select_a_where.click();
                    select_modal_select_where.innerHTML = obj.innerHTML;
                } else {
                    //JUST OPEN THE WHERE'S MODAL AND SELECT THE FIRST CHILD
                    select_a_andor.click();
                    select_modal_select_andor.childNodes[1].selected = true;
                }
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-having') {
        //SEARCH THE SELECTED CHILD
        for (i = 1; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //ENABLES AND DISABLES SOME TAGS
                select_modal_opt_having.disabled = false;
                select_modal_input_having.disabled = true;
                //SET DISPLAY OF TAG
                select_modal_button_having.style.display = "none";
                //PUT IN LIST OF HAVING WHICH WAS COLUMN CHOSEN AND REMOVE THE SELECTED CHILD
                window.list_having.push(obj.childNodes[i].value);
                obj.removeChild(obj.childNodes[i]);
                //DISABLES THE OBJECT AND OPEN HAVING'S MODAL
                obj.disabled = true;
                select_a_having.click();
            }
        }
    }
}

function clientJoinSelect(obj) {
    //DEFINE VARIABLE
    var i = 0;
    //SEARCH FOR SELECTED CHILD
    for (i = 0; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //DISABLES THE OBJECT
            obj.disabled = true;
            //ENABLE AND DISABLED SPECIFIC TAG'S
            select_select_table.disabled = false;
            select_select_group.disabled = true;
            select_select_column.disabled = true;
            select_select_where.disabled = true;
            select_select_having.disabled = true;
            select_select_func.disabled = true;
            //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
            window.list_join.push(obj.childNodes[i].value);
        }
    }
}

function clientJoinButton(obj) {
    //VERIFY WHAT BUTTON CALL THE FUNCTION
    if (obj.id == 'button-join-close') {
        //SELECT THE FIRST CHILD OF TAG
        select_select_join.childNodes[1].selected = true;
        //SET DISPLAY OF TAGS
        select_modal_button_andor_join.style.display = "none";
        obj.style.display = "none";
        //RESTART THE VALUE OF TAG
        select_modal_input_join.value = '';
        //DISABLES THE TAG
        select_select_table.disabled = true;
    }
    //VERIFY WHAT BUTTON CALL THE FUNCTION
    if (obj.id == 'button-join-andor') {
        //RESTART SELECTS OF MODAL
        select_modal_select1_join.disabled = false;
        select_modal_select1_join.childNodes[1].selected = true;
        select_modal_select2_join.childNodes[0].selected = true;
        //SET DISPLAY OF TAG
        obj.style.display = "none";
        select_modal_opt_andor_join.childNodes[1].selected = true;
        //CLOSE JOIN'S MODAL AND OPEN ANDOR'S MODAL
        select_modal_button_close_join.click();
        select_a_andor_join.click();
    }
    //VERIFY WHAT BUTTON CALL THE FUNCTION
    if (obj.id == 'button-join-confirm') {
        //SET DISPLAY OF TAGS
        obj.style.display = "none";
        select_modal_button_close_join.style.display = "inline";
        //TEST IF THE TAG IS NOT EMPTY
        if (select_modal_select1_join.childElementCount != 1) {
            select_modal_button_andor_join.style.display = "inline";
        }
        //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
        window.list_join[window.list_join.length - 1] += select_modal_input_join.value;
        //CLEAN AND DISABLE TAG
        select_modal_input_join.value = '';
        select_modal_input_join.disabled = true;
    }

}

function clientSet(obj) {
    //PUT IN LIST OF SET WHICH WAS COLUMN CHOSEN
    window.list_set[window.list_set.length - 1] += "=" + update_input_set.value;
    //SET DISPLAY OF TAG
    obj.style.display = "none";
    //DISABLES OBJECT IF HE IS EMPTY
    if (update_select_set.childNodes.length == 1) {
        update_select_set.disabled = true;
    }
}

function clientWhere(obj) {
    //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
    window.list_where[window.list_where.length - 1] += delete_input_where.value;
    //SET DISPLAY OF TAG
    obj.style.display = "none";
    //RESTART TAGS
    select_modal_select_where.childNodes[0].selected = true;
    select_select_where.firstChild.selected = true;
    //DISABLES OBJECT IF HE IS EMPTY
    if (delete_select_where.childNodes.length == 1) {
        delete_select_where.disabled = true;
    }
}

function clientHaving() {
    //PUT IN LIST OF HAVING WHICH WAS COLUMN CHOSEN
    window.list_having[window.list_having.length - 1] += " " + select_modal_input_having.value;
    //DISABLES TAG
    select_select_having.disabled = true;
}

function clientJoinAndor(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //SEARCH THE SELECTED CHILD
    for (i = 0; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
            window.list_join.push(obj.childNodes[i].value);
            //OPEN MODALS
            select_modal_button_andor.click();
            select_a_join.click();
        }
    }

}

function clientJoin() {
    //DEFINE VARIABLES
    var table = clientDictionary(window.list_table[0], 'all');
    var i = 0;
    //TEST IF OBJECT IS EMPTY
    if (select_modal_select1_join.childElementCount == 1) {
        //FILL JOIN'S SELECT1 MODAL
        for (i = 0; i < table.length; i++) {
            select_modal_select1_join.innerHTML += "<option class='option-join-first' value='" + window.list_table[0] + "." + table[i].key + "'>" + window.list_table[0] + "." + table[i].key + "</option>";
        }
    }
    //FILL JOIN'S SELECT2 MODAL
    select_modal_select2_join.innerHTML = "<option class='option-join-on' value=''>Choose a column</option>";
    var table = clientDictionary(window.list_table[window.list_table.length - 1], 'all');
    for (i = 0; i < table.length; i++) {
        select_modal_select2_join.innerHTML += "<option class='option-join-on' value='" + window.list_table[window.list_table.length - 1] + "." + table[i].key + "'>" + window.list_table[window.list_table.length - 1] + "." + table[i].key + "</option>";
    }

}

function clientJoinModal(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-join-first') {
        //SEARCH THE SELECTED CHILD
        for (i = 0; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
                window.list_join.push(obj.childNodes[i].value);
                //ENABLE AND DISABLE SOME TAG'S
                obj.disabled = true;
                select_modal_opt_join.disabled = false;
            }
        }
        //SET DISPALY OF TAG
        select_modal_button_close_join.style.display = "none";
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-join-opt') {
        //SEARCH THE SELECTED CHILD
        for (i = 0; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
                window.list_join[window.list_join.length - 1] += obj.childNodes[i].value;
                //ENABLE AND DISABLE SOME TAGS
                obj.childNodes[1].selected = true;
                obj.disabled = true;
                select_modal_input_join.disabled = false;
                //TEST IF OBJECT IS EMPTY
                if (select_modal_select2_join.childNodes.length != 1) {
                    select_modal_select2_join.disabled = false;
                }
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-join-modal' || obj.id == 'input-join') {
        //DISABLE TAG AND SET DISPLAY OF BUTTON
        select_modal_button_confirm_join.style.display = "inline";
        select_modal_select2_join.disabled = true;
        //VERIFY WHO DRAWS FUNCTION
        if (obj.id == 'select-join-modal') {
            //SEARCH THE SELECTED CHILD
            for (i = 0; i < obj.childNodes.length; i++) {
                if (obj.childNodes[i].selected) {
                    //PUT IN LIST OF JOIN WHICH WAS COLUMN CHOSEN
                    window.list_join[window.list_join.length - 1] += obj.childNodes[i].value;
                    //DISABLE TAG
                    select_modal_input_join.disabled = true;
                }
            }
        }
    }
}

function clientFunction() {
    //DEFINE VARIABLES
    var i = 0;
    var j = 0;
    //VERIFY IF LIST OF GROUP IS EMPTY
    if (window.list_group.length == 0) {
        //FILL FUNCTION'S MODAL FOR EACH TABLE ON LIST OF TABLES
        for (i = 0; i < window.list_table.length; i++) {
            var list = clientDictionary(window.list_table[i], 'all');
            for (j = 0; j < list.length; j++) {
                select_modal_select_func.innerHTML += "<option class='option-on-func' value='" + window.list_table[i] + "." + list[j].key + "'>" + window.list_table[i] + "." + list[j].key + "</option>";
            }
        }
    } else {
        //FILL FUNCTION'S MODAL FOR EACH COLUMN ON LIST OF GROUP
        for (i = 0; i < window.list_group.length; i++) {
            select_modal_select_func.innerHTML += "<option class='option-on-func' value='" + window.list_group[i] + "'>" + window.list_group[i] + "</option>";
        }
    }
}

function clientFunctionButton(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //SET DISPLAY OF TAG
    select_modal_button_func.style.display = "inline";
    //SEARCH THE SELECTED CHILD
    for (i = 0; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //PUT IN LIST OF FUNCTION WHICH WAS COLUMN CHOSEN
            window.list_func[window.list_func.length - 1] += "(" + obj.childNodes[i].value + ")";
            //FILL SPECIFIC TAGS WITH CHOOSEN COLUMN
            select_select_having.innerHTML += "<option class='option-having'>" + window.list_func[window.list_func.length - 1] + "</option>";
            select_select_order.innerHTML += "<option class='option-order'>" + window.list_func[window.list_func.length - 1] + "</option>";
            //REMOVE THE SELECTED CHILD AND DISABLE THE OBJECT
            obj.removeChild(obj.childNodes[i]);
            obj.disabled = true;
        }
    }
}

function clientWhereModal(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-where-opt') {
        //SEARCH THE SELECTED CHILD
        for (i = 0; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
                window.list_where[window.list_where.length - 1] += obj.childNodes[i].value;
                //DISABLE SOME TAGS
                obj.childNodes[1].selected = true;
                obj.disabled = true;
                select_modal_input_where.disabled = false;
                //TEST IF OBJECT IS EMPTY
                if (select_modal_select_where.childNodes.length > 1) {
                    select_modal_select_where.disabled = false;
                }
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-where-modal') {
        //DISABLE TAG
        select_modal_input_where.disabled = true;
        //SEARCH THE SELECTED CHILD
        for (i = 0; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
                window.list_where[window.list_where.length - 1] += obj.childNodes[i].value;
                //DISABLE TAG AND SET DISPLAY OF BUTTON
                obj.disabled = true;
                select_modal_button_where.style.display = "inline";
                //FILL WHERE'S SELECT
                select_select_where.innerHTML = obj.innerHTML;
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'input-where') {
        //DISABLE TAG AND SET DISPLAY OF BUTTON
        select_modal_select_where.disabled = true;
        select_modal_button_where.style.display = "inline";
    }

}

function clientSetModal() {
    //SET DISPLAY OF BUTTON
    update_modal_button.style.display = "inline";
}

function clientAndorModal(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //SEARCH THE SELECTED CHILD
    for (i = 0; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
            window.list_where.push(obj.childNodes[i].value);
        }
    }
    //CLICK ON ANDOR'S BUTTON
    select_modal_button_andor_where.click();
}

function clientAndorButton() {
    //DEFINE VARIABLES
    var i = 0;
    //SEARCH THE SELECTED CHILD
    for (i = 0; i < select_select_where.childNodes.length; i++) {
        if (select_select_where.childNodes[i].selected) {
            //PUT IN LIST OF WHERE WHICH WAS COLUMN CHOSEN
            window.list_where.push(select_select_where.childNodes[i].value);
            //OPEN WHERE'S MODAL
            select_a_where.click();
            //CLEAN THE INPUT OF MODAL
            select_modal_input_where.value = "";
            //FILL MODAL'S SELECT
            select_select_modal_where.innerHTML = select_select_where.innerHTML;
        }
    }
}

function clientHavingModal(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'select-having-opt') {
        //SEARCH THE SELECTED CHILD
        for (i = 0; i < obj.childNodes.length; i++) {
            if (obj.childNodes[i].selected) {
                window.list_having[window.list_having.length - 1] += " " + obj.childNodes[i].value;
                //ENABLE AND DISABLE SOME TAGS
                obj.childNodes[1].selected = true;
                obj.disabled = true;
                select_modal_input_having.disabled = false;
            }
        }
    }
    //VERIFY WHO DRAWS FUNCTION
    if (obj.id == 'input-having') {
        //SET DISPLAY OF BUTTON
        select_modal_button_having.style.display = "inline";
    }

}

function clientSetSelect(name) {
    //DEFINE VARIABLES
    var list = clientDictionary(name, 'all');
    var i = 0;
    var html = "";
    //FILL THE SET'S SELECT
    for (i = 0; i < list.length; i++) {
        html += "<option class='option-set' value='" + list[i].key + "'>" + list[i].key + "</option>";
    }
    return html;
}

function clientWhereSelect(name) {
    //DEFINE VARIABLES
    var list = clientDictionary(name, 'all');
    var i = 0;
    var html = "";
    //FILL THE WHERE'S SELECT
    for (i = 0; i < list.length; i++) {
        html += "<option class='option-where' value='" + list[i].key + "'>" + list[i].key + "</option>";
    }
    return html;
}

function clientOrder(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //SEARCH THE SELECTED CHILD
    for (i = 0; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //DEFINE THE CHOOSEN ORDER
            window.var_order += " " + obj.childNodes[i].value;
            //CLOSE ORDER'S MODAL
            select_modal_button_order.click();
        }
    }
}
function clientSelectOption(obj) {
    //DEFINE VARIABLES
    var i = 0;
    //SEARCH THE SELECTED CHILD
    for (i = 1; i < obj.childNodes.length; i++) {
        if (obj.childNodes[i].selected) {
            //DEFINE THE CHOOSEN SELECT
            window.var_select = obj.childNodes[i].value;
        }
    }
    //CLOSE SELECT'S MODAL
    select_modal_button_select.click();
    //SET DISPLAY OF TAGS
    select_confirm.style.display = "none";
    select_execute.style.display = "inline";
}

function clientInsertInput(list) {
    //DEFINE VARIABLES
    var i = 0;
    var html = "";
    //FILL THE INSERT'S TAG OF INPUT
    for (i = 0; i < list.length; i++) {
        html += "<div class='col-lg-2 m-bot15'>";
        html += "<label for='input-label'>" + list[i].key + "</label>";
        html += "<input class='form-control input-insert' id='input-label' placeholder='" + clientDictionary(window.list_table[0], list[i].key) + "' type='text'/>";
        html += "</div>";
    }
    return html;
}

function clientColumn(name) {
    //DEFINE VARIABLES
    var list = clientDictionary(name, 'all');
    var html = "";
    var i = 0;
    //FILL COLUMNS OF SELECT
    for (i = 0; i < list.length; i++) {
        html += "<option class='option-column' id='" + name + "' value='" + name + "." + list[i].key + "'>" + name + "." + list[i].key + "</option>";
    }
    return html;
}

function clientWhereOption(name) {
    //DEFINE VARIABLES
    var list = clientDictionary(name, 'all');
    var html = "";
    //FILL TAGS OF DELETE OR UPDATE
    if (window.mode == 'delete' || window.mode == 'update') {
        for (i = 0; i < list.length; i++) {
            html += "<option class='option-where' value='" + list[i].key + "'>" + list[i].key + "</option>";
        }
    } else {
        for (i = 0; i < list.length; i++) {
            html += "<option class='option-where' id='" + name + "' value='" + name + "." + list[i].key + "'>" + name + "." + list[i].key + "</option>";
        }
    }
    return html;
}

function clientOrderSelect() {
    //DEFINE VARIABLES
    var i = 0;
    var j = 0;
    var html = "";
    //FILL THE ORDER'S SELECT FOR EACH TABLE ON LIST OF TABLES
    for (i = 0; i < window.list_table.length; i++) {
        var list = clientDictionary(window.list_table[i], 'all');
        for (j = 0; j < list.length; j++) {
            html += "<option class='option-column' id='" + list_table[i] + "' value='" + list_table[i] + "." + list[j].key + "'>" + list_table[i] + "." + list[j].key + "</option>";
        }
    }
    return html;
}

function clientSqlInsert() {
    //DEFINE VARIABLES
    var i = 0;
    var sql = "INSERT INTO " + window.list_table[0] + " VALUES(";
    //FILL THE REST OF SQL
    for (i = 0; i < insert_input.length; i++) {
        //TEST IF ALL INPUT IS FILL
        if (insert_input[i].value == "") {
            sql = "";
            alert("Please, complete all de text fields");
            break;
        }
        //WRITE THE SQL
        if (i == insert_input.length - 1) {
            sql += insert_input[i].value + ")";
            break;
        } else {
            sql += insert_input[i].value + ",";
        }
    }
    //SET COOKIE FOR PHP
    document.cookie = window.mode + "=" + sql;
}

function clientSqlDelete() {
    //DEFINE VARIABLES
    var i = 0;
    var sql = "DELETE FROM " + window.list_table[0] + " ";
    //TEST IF CONDITION WAS CHOSEN
    if (window.list_where.length == 0) {
        if (!confirm("Attention! no 'where' chosen. Are you sure you want to continue?")) {
            sql = "";
        }
    } else {
        //WRITE THE SQL
        sql += "WHERE ";
        for (i = 0; i < window.list_where.length; i++) {
            sql += window.list_where[i] + " ";
        }
    }
    //SET COOKIE FOR PHP
    document.cookie = window.mode + "=" + sql;
}

function clientSqlUpdate() {
    //DEFINE VARIABLES
    var i = 0;
    var sql = "UPDATE " + window.list_table[0] + " SET ";
    //WRITE THE SQL
    for (i = 0; i < window.list_set.length; i++) {
        sql += window.list_set[i] + " ";
    }
    //TEST IF CONDITION WAS CHOSEN
    if (window.list_where.length == 0) {
        if (!confirm("Attention! no 'where' chosen. Are you sure you want to continue?")) {
            sql = "";
        }
    } else {
        //WRITE THE SQL
        sql += "WHERE ";
        for (i = 0; i < window.list_where.length; i++) {
            sql += window.list_where[i] + " ";
        }
    }
    //SET COOKIE FOR PHP
    document.cookie = window.mode + "=" + sql;
}

function clientSqlSelect() {
    //DEFINE VARIABLES
    var sql = "SELECT " + window.var_select + " ";
    var i = 0;

    //PART OF SELECT
    if (window.list_column.length == 0) {
        sql += window.list_func[0] + " ";
    } else {
        if (window.list_group.length == 0) {
            for (i = 0; i < window.list_column.length; i++) {
                if (window.list_column.length - 1 == i) {
                    sql += window.list_column[i] + " ";
                } else {
                    sql += window.list_column[i] + ", ";
                }
            }
        } else {
            for (i = 0; i < window.list_group.length; i++) {
                if (window.list_group.length - 1 == i) {
                    sql += window.list_group[i] + " ";
                } else {
                    sql += window.list_group[i] + ", ";
                }
            }
            if (window.list_func.length != 0) {
                sql += "," + window.list_func[0] + " ";
            }
        }
    }
    sql += "FROM ";
    //PART OF FROM WITH OR WITHOUT JOIN
    if (window.list_join.length == 0) {
        for (i = 0; i < window.list_table.length; i++) {
            if (window.list_table.length - 1 == i) {
                sql += window.list_table[i] + " ";
            } else {
                sql += window.list_table[i] + ", ";
            }
        }
    } else {
        sql += window.list_table[0] + " ";
        for (i = 0; i < window.list_join.length; i++) {
            sql += window.list_join[i] + " ";
        }
    }
    //PART OF WHERE
    if (window.list_where.length != 0) {
        sql += "WHERE ";
        for (i = 0; i < window.list_where.length; i++) {
            sql += window.list_where[i] + " ";
        }
    }
    //PART OF GROUP BY
    if (window.list_group.length != 0) {
        sql += "GROUP BY ";
        for (i = 0; i < window.list_group.length; i++) {
            if (window.list_group.length - 1 == i) {
                sql += window.list_group[i] + " ";
            } else {
                sql += window.list_group[i] + ", ";
            }
        }
    }
    //PART OF HAVING
    if (window.list_having.length != 0) {
        sql += "HAVING ";
        sql += window.list_having[0] + " ";
    }
    //PART OF ORDER BY
    if (window.var_order != "") {
        sql += "ORDER BY ";
        sql += window.var_order;
    }
    //SET COOKIE FOR PHP
    document.cookie = window.mode + "=" + sql;
}