<?php
    // Allow cross-origin requests (CORS) for development testing.
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json; charset=UTF-8");

    // Simulate database records.
    $students = [
        [
            "name" => "Brendan Eich",
            "matric_no" => "AC123",
            "marks" => [
                "cw" => 50,
                "fe" => 25
            ]
        ],
        [
            "name" => "Rasmus Lerdof",
            "matric_no" => "AC456",
            "marks" => [
                "cw" => 55,
                "fe" => 30
            ]
        ],
        [
            "name" => "Bjarne Stroustrup",
            "matric_no" => "AC789",
            "marks" => [
                "cw" => 48,
                "fe" => 40
            ]
        ]
    ];

    // Check if a specific matric_no is requested via GET/POST.
    $search_matric = isset($_REQUEST['matric_no']) ? trim($_REQUEST['matric_no']) : '';

    if ($search_matric !== '') {
        $filtered = [];
        foreach ($students as $student) {
            if (strcasecmp($student['matric_no'], $search_matric) === 0) {
                $filtered[] = $student;
            }
        }
        // Return only matching student records encoded as JSON.
        echo json_encode($filtered);
    } else {
        // Return all student records encoded as JSON.
        echo json_encode($students);
    }
?>
