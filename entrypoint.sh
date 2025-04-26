#!/bin/bash

# Đường dẫn tới thư mục chứa file OSM
OSM_DIR="/app/osm-data"
OSM_FILE="$OSM_DIR/vietnam-latest.osm.pbf"

# Tạo thư mục nếu chưa tồn tại
mkdir -p "$OSM_DIR"

# Kiểm tra nếu file OSM chưa tồn tại thì tải về
if [ ! -f "$OSM_FILE" ]; then
    echo "Đang tải dữ liệu OSM từ Geofabrik..."
    wget https://download.geofabrik.de/asia/vietnam-latest.osm.pbf -O "$OSM_FILE"
    if [ $? -ne 0 ]; then
        echo "Lỗi: Không thể tải tệp OSM!"
        exit 1
    fi
else
    echo "Tệp OSM đã tồn tại: $OSM_FILE"
fi

# Kiểm tra xem tệp OSM có phải là tệp hợp lệ không
if [ ! -s "$OSM_FILE" ]; then
    echo "Lỗi: Tệp OSM rỗng hoặc không tồn tại!"
    exit 1
fi

# Khởi động GraphHopper
echo "Khởi động GraphHopper..."
java -jar graphhopper-web.jar server config.yml