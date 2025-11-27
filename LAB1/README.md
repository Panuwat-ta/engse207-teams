# TikTok System

## C1
![](C1.png)

### 1\. C1: System Context Diagram

**ระดับนี้แสดงภาพรวม:** ระบบ TikTok สื่อสารกับใคร (Users) และระบบภายนอก (External Systems) อะไรบ้าง

#### **องค์ประกอบ (Elements):**

1.  **TikTok System (The Software System):** ระบบแพลตฟอร์มวิดีโอสั้นและการไลฟ์สตรีม
2.  **Actors (ผู้ใช้งาน):**
      * **General User (Viewer/Creator):** ผู้ใช้ทั่วไปที่ดูวิดีโอ, กดไลก์, คอมเมนต์ และอัปโหลดคอนเทนต์
      * **Advertiser:** ผู้ลงโฆษณาที่ต้องการโปรโมตสินค้า
      * **Admin/Moderator:** เจ้าหน้าที่ดูแลความเรียบร้อยและตรวจสอบเนื้อหา
3.  **External Systems (ระบบภายนอก):**
      * **Identity Providers:** ระบบล็อกอิน (Google, Facebook, Apple ID)
      * **Payment Gateways:** ระบบชำระเงิน (App Store, Google Play, Stripe) สำหรับซื้อ Coins/Gift
      * **CDN (Content Delivery Network):** ระบบกระจายข้อมูลเพื่อให้โหลดวิดีโอได้เร็วทั่วโลก (เช่น Akamai, Cloudflare)
      * **Push Notification Services:** (APNs, FCM) สำหรับแจ้งเตือนไปยังมือถือ

#### **คำอธิบายความสัมพันธ์ (Relationships):**

  * **User** $\rightarrow$ ดู/อัปโหลดวิดีโอ $\rightarrow$ **TikTok System**
  * **Advertiser** $\rightarrow$ จัดการแคมเปญโฆษณา $\rightarrow$ **TikTok System**
  * **TikTok System** $\rightarrow$ ตรวจสอบตัวตน (Auth) $\rightarrow$ **Identity Providers**
  * **TikTok System** $\rightarrow$ ประมวลผลการจ่ายเงิน $\rightarrow$ **Payment Gateways**
  * **TikTok System** $\rightarrow$ ส่งไฟล์วิดีโอไปยัง $\rightarrow$ **CDN** เพื่อให้ User ดึงข้อมูลได้เร็วขึ้น

-----

## C2
![](C2.png)

 C2: Container Diagram

**ระดับนี้ซูมเข้าไปใน TikTok System:** ดูว่ามี "Container" (แอป, เซิร์ฟเวอร์, ฐานข้อมูล) อะไรบ้างที่ทำงานร่วมกัน

[Image of microservices architecture diagram]

#### **องค์ประกอบ (Containers):**

1.  **Mobile App (iOS/Android):**
      * แอปพลิเคชันหลักที่ผู้ใช้ใช้งาน เขียนด้วย Swift/Kotlin/Flutter
      * หน้าที่: แสดงผลวิดีโอ, บันทึกวิดีโอ, ใส่ฟิลเตอร์, ส่ง Request ไปยัง Backend
2.  **Web Application:**
      * เว็บสำหรับดูผ่านเบราว์เซอร์ (React/Vue.js)
3.  **API Gateway:**
      * ประตูหน้าด่าน รับ Request จาก App/Web จัดการเรื่อง Load Balancing, Security, Rate Limiting
4.  **Microservices (Backend):**
      * **Auth Service:** จัดการ User Session, Login
      * **Video Processing Service:** รับไฟล์วิดีโอ, แปลงไฟล์ (Transcoding), ใส่ลายน้ำ
      * **Recommendation Engine (Core):** ระบบ AI/ML ที่คำนวณว่าผู้ใช้ควรเห็นคลิปไหนถัดไป (หัวใจสำคัญของ TikTok)
      * **User Profile & Social Service:** จัดการข้อมูลส่วนตัว, การติดตาม (Follow), เพื่อน
      * **Interaction Service:** จัดการ Likes, Comments, Shares
5.  **Data Stores (Database & Storage):**
      * **Object Storage (e.g., AWS S3, GCS):** เก็บไฟล์วิดีโอจริง ๆ และรูปโปรไฟล์ (Unstructured Data)
      * **NoSQL DB (e.g., Cassandra/DynamoDB/MongoDB):** เก็บข้อมูลที่มีปริมาณมหาศาลและต้องการความเร็วสูง เช่น ยอดไลก์, คอมเมนต์, Feed
      * **Relational DB (e.g., PostgreSQL/MySQL):** เก็บข้อมูลธุรกรรมการเงิน, ข้อมูลบัญชีผู้ใช้ที่ต้องการความถูกต้องสูง (ACID)
      * **Cache (Redis/Memcached):** เก็บข้อมูลที่ถูกเรียกบ่อย ๆ (เช่น คลิปที่เป็น Viral) เพื่อลดภาระ Database

#### **คำอธิบายความสัมพันธ์ (Relationships):**

1.  **Mobile App** ส่ง HTTPS Request ไปยัง $\rightarrow$ **API Gateway**
2.  **API Gateway** กระจายงานไปยัง $\rightarrow$ **Microservices** ต่างๆ ตามหน้าที่
3.  **Video Processing Service** บันทึกไฟล์วิดีโอลง $\rightarrow$ **Object Storage**
4.  **Recommendation Engine** ดึงข้อมูลพฤติกรรมจาก $\rightarrow$ **NoSQL DB** มาวิเคราะห์ แล้วส่งรายการคลิปกลับไปที่ App
5.  **Mobile App** ดึงไฟล์วิดีโอจริงๆ จาก $\rightarrow$ **CDN** (ซึ่งดึงมาจาก Object Storage อีกที)

-----

