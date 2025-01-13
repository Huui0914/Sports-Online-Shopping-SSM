//打开一个新窗口，窗口加载的页面是:upload/preUpload.action
function selimage() {
    window.open(
        "upload/preUpload.action",      // 1. 打开的页面 URL
        "",                             // 2. 新窗口的名称（空字符串表示无名称）
        "toolbar=no,location=no," +     // 3. 禁用工具栏和地址栏
        "directories=no,status=no," +   //    禁用目录栏和状态栏
        "menubar=no,resizable=yes," +   //    禁用菜单栏，但允许窗口调整大小
        "copyhistory=no,scrollbars=yes," + // 禁用历史记录按钮，但允许滚动条
        "width=400,height=240," +       // 4. 窗口的宽和高
        "top=" + (screen.availHeight - 240) / 2 + "," +  // 5. 计算窗口的垂直居中位置
        "left=" + (screen.availWidth - 400) / 2          //    计算窗口的水平居中位置
    );
}

//打开一个新窗口，窗口加载的页面是:preFiles.action
function savefile() {
    window.open(
        "upload/preFiles.action",       // 加载的页面 URL，与 `selimage` 的 URL 不同
        "",                             // 新窗口的名称，仍为空
        "toolbar=no,location=no," +     // 禁用工具栏和地址栏
        "directories=no,status=no," +   // 禁用目录栏和状态栏
        "menubar=no,resizable=yes," +   // 禁用菜单栏，允许窗口调整大小
        "copyhistory=no,scrollbars=yes," + // 禁用历史记录按钮，允许滚动条
        "width=400,height=240," +       // 窗口的宽和高
        "top=" + (screen.availHeight - 240) / 2 + "," +  // 垂直居中位置
        "left=" + (screen.availWidth - 400) / 2          // 水平居中位置
    );
}

