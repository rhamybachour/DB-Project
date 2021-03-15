<!-- SIDEBAR START -->
<aside>

    <!-- SIDEBAR START -->
    <div id="sidebar"  class="nav-collapse ">

        <ul class="sidebar-menu" id="nav-accordion">
            <li>
                <a class="<?php if ($_SERVER['REQUEST_URI'] == '/query') echo 'active'; if ($_SERVER['REQUEST_URI'] == '/') echo 'active'; ?>" href="query" >
                    <i class="fa fa-search"></i>
                    <span>Query </span>
                </a>
            </li>
            <li class="sub-menu">
                <a href="javascript:;"  class="<?php if ($_SERVER['REQUEST_URI'] == '/insert') echo 'active'; if ($_SERVER['REQUEST_URI'] == '/select') echo 'active'; if ($_SERVER['REQUEST_URI'] == '/update') echo 'active'; if ($_SERVER['REQUEST_URI'] == '/delete') echo 'active'; ?>">
                <i class="fa fa-rocket"></i>
                <span>Application </span>
                </a>
                <ul class="sub">
                    <li class="<?php if ($_SERVER['REQUEST_URI'] == '/insert') echo 'active'; ?>">
                        <a href="insert">Insert</a>
                    </li>
                    <li class="<?php if ($_SERVER['REQUEST_URI'] == '/select') echo 'active'; ?>">
                        <a href="select">Select</a>
                    </li>
                    <li class="<?php if ($_SERVER['REQUEST_URI'] == '/update') echo 'active'; ?>">
                        <a href="update">Update</a>
                    </li>
                    <li class="<?php if ($_SERVER['REQUEST_URI'] == '/delete') echo 'active'; ?>">
                        <a href="delete">Delete</a>
                    </li>
                </ul>
            </li>

            <!-- FUNCTION BUTTON RESULT -->
            <?php serverButton(); ?>
        
        </ul>

    </div>
    <!-- SIDEBAR END -->

</aside>
<!-- SIDEBAR END -->