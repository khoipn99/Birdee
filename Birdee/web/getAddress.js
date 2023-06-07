const provinceSelect = document.getElementById('province-select');
const districtSelect = document.getElementById('district-select');
const wardSelect = document.getElementById('ward-select');

// Lấy dữ liệu các tỉnh/thành phố
fetch('https://provinces.open-api.vn/api/?depth=3')
        .then(response => response.json())
        .then(data => {
            // Thêm các tỉnh vào thẻ select
            data.forEach(province => {
                const option = document.createElement('option');
                option.value = province.code;
                option.text = province.name;
                provinceSelect.add(option);
            });
        });

// Khi người dùng chọn tỉnh
provinceSelect.addEventListener('change', () => {
    // Xóa các option cũ trong thẻ select quận/huyện và xã/phường
    while (districtSelect.options.length > 1) {
        districtSelect.remove(1);
    }
    while (wardSelect.options.length > 1) {
        wardSelect.remove(1);
    }

    // Lấy dữ liệu các quận/huyện của tỉnh đang chọn
    const provinceName = provinceSelect.value;
    fetch(`https://provinces.open-api.vn/api/p/${encodeURIComponent(provinceName)}?depth=2`)
            .then(response => response.json())
            .then(data => {
                // Thêm các quận/huyện vào thẻ select
                data.districts.forEach(district => {
                    const option = document.createElement('option');
                    option.value = district.code;
                    option.text = district.name;
                    districtSelect.add(option);
                });
            });
});

// Khi người dùng chọn quận/huyện
districtSelect.addEventListener('change', () => {
    // Xóa các option cũ trong thẻ select xã/phường
    while (wardSelect.options.length > 1) {
        wardSelect.remove(1);
    }

    // Lấy dữ liệu các xã/phường của quận/huyện đang chọn
    const provinceName = provinceSelect.value;
    const districtName = districtSelect.value;
    fetch(`https://provinces.open-api.vn/api/d/${encodeURIComponent(districtName)}?depth=2`)
            .then(response => response.json())
            .then(data => {
                // Thêm các xã/phường vào thẻ select
                data.wards.forEach(ward => {
                    const option = document.createElement('option');
                    option.value = ward.code;
                    option.text = ward.name;
                    wardSelect.add(option);
                });
            });
});

// Hàm kiểm tra và trả về kết quả
function checkName() {
    const PName = provinceSelect.options[provinceSelect.selectedIndex].text;
    const DName = districtSelect.options[districtSelect.selectedIndex].text;
    const WName = wardSelect.options[wardSelect.selectedIndex].text;

    const result = [WName, DName, PName];
    return result;
}

// Lấy thẻ div để hiển thị kết quả
const resultDiv = document.getElementById('result');

// Khi click button "Kiểm tra"
document.getElementById('check-button').addEventListener('click', () => {
    // Kiểm tra và lưu kết quả vào biến result
    const result = checkName();
});
function sendResultToServlet(result) {
    fetch('controller/RegisterServlet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(result)
    })
            .then(response => {
                // Xử lý phản hồi từ Servlet (nếu cần)
            })
            .catch(error => {
                // Xử lý lỗi (nếu có)
            });
}

// Gọi hàm sendResultToServlet với giá trị result
result = checkName();
sendResultToServlet(result);