# Luckfox glibc buildroot
這個專案只在Luckfox pico zero，轉換成基於glibc使Bluez套件可以正常執行，進而方便開發。
## 用法
1. clone 這個專案。
2. 首先需要先下載Luckfox官方的SDK，編譯以後直接燒錄到Luckfox裡面。
3. 在另一個資料夾git clone buildroot專案 [官方github mirror](https://github.com/buildroot/buildroot)。
4. 在clone下來的buildroot資料夾裡面，輸入`make BR2_EXTERNAL=/path/to/dir luckfox_defconfig menuconfig` 自行將路徑轉換為這個專案（luckfox-glibc-buildroot）的路徑，理論上輸入一次BR2_EXTERNAL以及defconfig以後，後面就不用輸入了。
5. 透過`make`指令進行編譯。
6. 編譯結果會存放在output裡面，使用update.sh進行燒錄，需要將Luckfox切換到燒錄模式（Maskrom模式），然後直接執行`./update.sh`，就可以直接燒錄到Luckfox pico zero。
## 原理
由於Bluez需要透過Dbus與其進行通訊，但是Dbus是基於Glibc，使用uclibc的環境會編譯不過，但是經過我的查詢Luckfox官方的sdk把套件的某些標頭檔換成別的標頭檔使其可以正確編譯，但是執行結果仍然是錯誤的，bluetoothctl工具會沒有任何回應。
因此這個專案目標是將整個rootfs轉換成基於Glibc，並且同時保留著Luckfox編譯出的Linux kernel。
保留Linux kernel的優勢如下：
1. 編譯出來的驅動可以直接load進Kernel。
2. 因為Luckfox官方的SDK還有包含切割分區、設備樹等等，就理論上如果只是想要讓藍芽可以使用只需要更改rootfs即可，不需要大費周章改這些。
  
接著要搞定的問題是npu的驅動（.ko）可以被load進kernel以後，如果要在userspace對其進行呼叫的話，還需要連結一個runtime的so，並且要是基於Glibc編譯的，最後成功在Luckfox官方SDK裡面找到基於Glibc的so。

