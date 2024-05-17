# demoAllSwift
1 Threading and GCD
Phân luồng và Grand Ventral Dispatch
+ Multithreading
+ Queues
+ Grand Central Dispathch
+ Sync (Mã đồng bộ)
+ Async (Không đồng bộ)
+ DispatchGroup

 + Multithreading: Ứng dụng sẽ chỉ định 1 Luồng chính để hiển thị giao diện người dùng của bạn và lắng nghe các sự kiện. Các tính toán phức tạp có thể làm chậm luồng chính vậy nên việc đa luồng được hình thành để chuyển tất cả các công việc nặng nhọc sang luồng nền và sau đó chuyển kết quả trở lại tại luồng chính.
  Chúng ta có thể tùy chỉnh dược thứ tự ưu tiên của các luồng.
+ Queue: Hàng đợi chỉ là một loạt các khối mã, được xếp thành hàng hoặc xếp hàng đời, chờ một luồng thực thi chúng.
+ Grand Central Dispathch: Đây là một API giúp quản lý hàng đợi của bạn và trách nhiệm của nó là khởi tạo hàng đợi và đặt các khối mã trên một khối mã đang chờ trong hàng đợi.
  Có 2 loại hàng đợi
                     Main Queue:(DispatchQueue.main) Hàng đợi nơi tất cả các khối mã ảnh hưởng đến UI phải được chạy trên đó. 
                     Background Queue:(DispatchQueue.global(qos: Qos)) Được sử dụng để xếp hàng các nhiệm vụ tồn tại lâu dài, không phải nhiệm vụ UI, thường chạy đồng thời hoặc song song với hàng đợi UI chính. QOS là độ ưu tiên gồm .userInteractive, .userInitiated, .utility, .background

  Synchronous(Đồng bộ): các tác vụ được thực thi tuần tự,tức là tác vụ sau chỉ bắt đầu khi tác vụ trước hoàn thành.
  Asynchronous(Bất đồng bộ): Tiếp tục thực thi các tác vụ khác mà không chờ đợi, kết quả sẽ được xử lý sau khi hoàn thành.
