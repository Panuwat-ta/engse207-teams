// ============================================
// Contact Controller
// Developer: สมหญิง (Backend Dev)
// Version: 1.1 (Bug Fixed)
// ============================================

const pool = require('../database/db');

const MAX_NAME_LENGTH = 50;

// ====================
// GET ALL CONTACTS
// ====================
exports.getAllContacts = async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT * FROM contacts ORDER BY created_at DESC'
        );

        res.json({
            success: true,
            data: result.rows,
            count: result.rows.length
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({
            success: false,
            error: 'ไม่สามารถดึงข้อมูลได้'
        });
    }
};

// ====================
// CREATE CONTACT
// ====================
exports.createContact = async (req, res) => {
    try {
        const { name, email, phone } = req.body;

        // validate type
        if (!name || typeof name !== 'string') {
            return res.status(400).json({
                success: false,
                error: 'กรุณาระบุชื่อ'
            });
        }

        const trimmedName = name.trim();

        // validate empty
        if (trimmedName.length === 0) {
            return res.status(400).json({
                success: false,
                error: 'กรุณาระบุชื่อ'
            });
        }

        // validate length
        if (trimmedName.length > MAX_NAME_LENGTH) {
            return res.status(400).json({
                success: false,
                error: `ชื่อต้องไม่เกิน ${MAX_NAME_LENGTH} ตัวอักษร (ปัจจุบัน ${trimmedName.length} ตัวอักษร)`
            });
        }

        const result = await pool.query(
            `INSERT INTO contacts (name, email, phone)
             VALUES ($1, $2, $3)
             RETURNING *`,
            [trimmedName, email || null, phone || null]
        );

        res.status(201).json({
            success: true,
            data: result.rows[0],
            message: 'เพิ่มรายชื่อสำเร็จ'
        });

    } catch (error) {
        console.error(error); // log ไว้ฝั่ง server
        res.status(500).json({
            success: false,
            error: 'เกิดข้อผิดพลาดในการเพิ่มรายชื่อ'
        });
    }
};

// ====================
// DELETE CONTACT
// ====================
exports.deleteContact = async (req, res) => {
    try {
        const { id } = req.params;

        if (isNaN(id)) {
            return res.status(400).json({
                success: false,
                error: 'ID ไม่ถูกต้อง'
            });
        }

        const result = await pool.query(
            'DELETE FROM contacts WHERE id = $1 RETURNING *',
            [id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({
                success: false,
                error: 'ไม่พบรายชื่อ'
            });
        }

        res.json({
            success: true,
            message: 'ลบรายชื่อสำเร็จ'
        });

    } catch (error) {
        console.error(error);
        res.status(500).json({
            success: false,
            error: 'ไม่สามารถลบได้'
        });
    }
};
