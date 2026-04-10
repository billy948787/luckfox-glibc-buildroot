# Luckfox glibc buildroot
這個專案只在Luckfox pico zero，轉換成基於glibc主要是想正常執行Bluez套件，進而方便開發。
## 用法
1. clone 這個專案。
2. 首先需要先下載Luckfox官方的SDK，編譯以後直接燒錄到Luckfox裡面。
3. 在另一個資料夾git clone buildroot專案 [官方github mirror](https://github.com/buildroot/buildroot)。
4. 在clone下來的buildroot資料夾裡面，輸入`make BR2_EXTERNAL=/path/to/dir luckfox_defconfig menuconfig` 自行將路徑轉換為這個專案（luckfox-glibc-buildroot）的路徑，理論上輸入一次BR2_EXTERNAL以及defconfig以後，後面就不用輸入了。
5. 透過`make`指令進行編譯。
6. 編譯結果會存放在output裡面，使用update.sh進行燒錄，需要將Luckfox切換到燒錄模式（Maskrom模式），然後直接執行`./update.sh`，就可以直接燒錄到Luckfox pico zero。
