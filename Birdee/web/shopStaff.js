/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $('#birdTable').DataTable();
    $('#accessoryTable').DataTable();
});

function handleImageUpload(event) {
    var previewContainer = document.getElementById("preview-container");
    var imageUrlsInput = document.getElementById("imageUrlsInput");
    var imageUrls = [];
    var mainImageIndex = 0;

    // Xóa các hình ảnh trước đó khỏi preview-container
    while (previewContainer.firstChild) {
        previewContainer.removeChild(previewContainer.firstChild);
    }

    // Lặp qua các hình ảnh đã chọn và hiển thị chúng trong preview-container
    var files = event.target.files;
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageUrl = URL.createObjectURL(file);
        imageUrls.push(imageUrl);

        var imgElement = document.createElement("img");
        imgElement.src = imageUrl;
        imgElement.className = "preview-image"; // Thêm class "preview-image" cho CSS styling
        previewContainer.appendChild(imgElement);

        // Tạo radio button để chọn ảnh chính
        var radioBtn = document.createElement("input");
        radioBtn.type = "radio";
        radioBtn.name = "mainImageIndex"; // Đặt tên cho radio button
        radioBtn.value = i; // Lưu chỉ số ảnh

        // Đặt sự kiện onchange cho radio button để xác định ảnh chính
        radioBtn.onchange = function () {
            mainImageIndex = parseInt(this.value);
        };

        // Thêm radio button vào container
        previewContainer.appendChild(radioBtn);
    }

    // Đặt giá trị của mainImageIndex vào input[type="hidden"]
    imageUrlsInput.value = imageUrls.join(",");
    document.getElementById("mainImageIndexInput").value = mainImageIndex;
}


function showConfirmation(action, event) {
    if (action === 'cancel') {
        swal({
            title: "Cancel Confirmation",
            text: "Bạn có muốn hủy bỏ hành động?",
            icon: "warning",
            buttons: ["Hủy", "Đồng ý"],
        }).then((confirm) => {
            if (confirm) {
                const shopEmail = document.getElementsByName('emailShop')[0].value;
                window.location.href = `MainController?action=ShowBList&shopEmail=${shopEmail}`;
            }
        });
    } else if (action === 'save') {
        event.preventDefault(); // Ngăn chặn sự kiện mặc định của nút Save

        var birdName = document.getElementsByName('birdName')[0].value;
        var dob = document.getElementsByName('dob')[0].value;
        var height = document.getElementsByName('height')[0].value;
        var weight = document.getElementsByName('weight')[0].value;
        var origin = document.getElementsByName('origin')[0].value;
        var description = document.getElementsByName('description')[0].value;
        var quantity = document.getElementsByName('quantity')[0].value;
        var price = document.getElementsByName('price')[0].value;

        if (birdName === '' || dob === '' || height === '' || weight === '' || origin === '' || description === '' || quantity === '' || price === '') {
            swal("Form không được hoàn tất", "Xin hãy điền vào toàn bộ ô còn trống", "error");
            return;
        }

        swal({
            title: "Cảnh báo",
            text: "Bạn có muốn thêm chim này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((confirm) => {
            if (confirm) {
                swal({
                    title: "Thêm chim thành công!",
                    timer: 1000,
                    buttons: false
                });
                setTimeout(function () {
                    var form = document.getElementById("birdForm");
                    var actionInput = document.createElement("input");
                    actionInput.setAttribute("type", "hidden");
                    actionInput.setAttribute("name", "action");
                    actionInput.setAttribute("value", "addbird");
                    form.appendChild(actionInput);
                    form.submit();
                }, 2000);
            }
        });
    }
}
function showConfirmation2(action, event) {
    if (action === 'cancel') {
        swal({
            title: "Cancel Confirmation",
            text: "Bạn có muốn hủy bỏ hành động?",
            icon: "warning",
            buttons: ["Hủy", "Đồng ý"],
        }).then((confirm) => {
            if (confirm) {
                const shopEmail = document.getElementsByName('emailShop')[0].value;
                window.location.href = `MainController?action=ShowAList&shopEmail=${shopEmail}`;
            }
        });
    } else if (action === 'save') {
        event.preventDefault(); // Ngăn chặn sự kiện mặc định của nút Save

        var accessoryName = document.getElementsByName('AccessoryName')[0].value;
        var description = document.getElementsByName('description')[0].value;
        var quantity = document.getElementsByName('quantity')[0].value;
        var price = document.getElementsByName('price')[0].value;

        if (accessoryName === '' || description === '' || quantity === '' || price === '') {
            swal("Form không được hoàn tất", "Xin hãy điền vào toàn bộ ô còn trống", "error");
            return;
        }

        swal({
            title: "Cảnh báo",
            text: "Bạn có muốn thêm phụ kiện này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((confirm) => {
            if (confirm) {
                swal({
                    title: "Thêm phụ kiện thành công!",
                    timer: 1000,
                    buttons: false
                });
                setTimeout(function () {
                    var form = document.getElementById("AccessoryForm");
                    var actionInput = document.createElement("input");
                    actionInput.setAttribute("type", "hidden");
                    actionInput.setAttribute("name", "action");
                    actionInput.setAttribute("value", "AddAccessory");
                    form.appendChild(actionInput);
                    form.submit();
                }, 2000);
            }
        });
    }
}





