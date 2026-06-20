<?php
    /**
     * =================================================================================
     * Application Entry Point & Route Registration (index.php)
     * =================================================================================
     * Why does this file not need to be required in "index.php"?
     * 1. Role as a Client (Frontend):
     *    - This file is a frontend client page containing HTML, CSS and Vue.js JavaScript.
     *    - It runs entirely in the user's web browser, not on the PHP server.
     * 2. Asynchronous Communication (fetch):
     *    - When you visit /02_HTTP_Request.php, the server simply serves this static HTML markup to your browser.
     *    - Once loaded, Vue.js makes asynchronous network requests (`fetch()`) over HTTP to the backend endpoints (e.g. /menus) managed by Slim (via index.php).
     * 3. Separation of Concerns:
     *    - Because it behaves as an independent client communicating over HTTP, it does not define or register any Slim routes, nor does it require access to the `$app` instance.
     * =================================================================================
     */
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>HTTP Request From Client</title>

    <!-- Vue.js 3 CDN -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

    <!-- CSS -->
    <style>
        body {
            font-family: sans-serif;
            margin: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        form {
            margin: 15px 0;
            padding: 15px;
            background: #fafafa;
            border: 1px solid #ccc;
        }
        input, select {
            padding: 5px 10px;
            width: 100%;
            box-sizing: border-box;
        }
        .center {
            text-align: center;
            align-items: center;
            justify-content: center;
        }
        .btn {
            padding: 5px 10px;
            cursor: pointer;
        }
        .btn-green { background: #e2f0d9; border: 1px solid #a8d08d; }
        .btn-blue { background: #ddebf7; border: 1px solid #9cc2e5; }
        .btn-yellow { background: #fff2cc; border: 1px solid #ffd966; }
        .btn-red { background: #fce4d6; border: 1px solid #f4b084; }
        .btn-gray { background: #f2f2f2; border: 1px solid #d9d9d9; }
        #grid-post {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(3, 1fr);
            gap: 8px;
        }
    </style>
</head>

<body>
    <div id="app">
        <h2>HTTP Request Client (Vue.js)</h2>

        <!-- GET Section -->
        <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 12px;">
            <button class="btn btn-green" @click="fetchMenus">Refresh Menu List (GET)</button>
            <span :style="{
                display: 'inline-block',
                width: '12px',
                height: '12px',
                borderRadius: '50%',
                backgroundColor: needsRefresh ? '#ef4444' : '#10b981',
                boxShadow: needsRefresh ? '0 0 8px #ef4444' : '0 0 8px #10b981',
                transition: 'background-color 0.3s, box-shadow 0.3s'
            }"></span>
            <span style="font-size: 13px; color: #64748b;">
                {{ needsRefresh ? 'Data out of sync. Please click GET to refresh.' : 'Data is up to date.' }}
            </span>
        </div>

        <!-- Menus Table -->
        <table>
            <thead>
                <tr>
                    <th width="1%" class="center">ID</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Price ($)</th>
                    <th>Description</th>
                    <th width="1%" class="center">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-if="menus.length === 0">
                    <td colspan="6" style="text-align: center;">No items found. Click Refresh to load.</td>
                </tr>
                <tr v-for="menu in menus" :key="menu.id">
                    <!-- View Mode -->
                    <template v-if="editingId !== menu.id">
                        <td width="1%" class="center">{{ menu.id }}</td>
                        <td>{{ menu.name }}</td>
                        <td>{{ menu.type }}</td>
                        <td>${{ parseFloat(menu.price).toFixed(2) }}</td>
                        <td>{{ menu.description || '-' }}</td>
                        <td class="center" style="white-space: nowrap;">
                            <div style="display: flex; gap: 8px;">
                                <button class="btn btn-yellow" @click="startEdit(menu)">PUT</button>
                                <button class="btn btn-red" @click="deleteMenu(menu.id)">DELETE</button>
                            </div>
                        </td>
                    </template>
                    
                    <!-- Edit Mode (PUT) -->
                    <template v-else>
                        <td width="1%" class="center">{{ menu.id }}</td>
                        <td><input v-model="editItem.name" type="text"></td>
                        <td>
                            <select v-model="editItem.type">
                                <option value="Food">Food</option>
                                <option value="Drink">Drink</option>
                            </select>
                        </td>
                        <td><input v-model.number="editItem.price" type="number" step="0.01" min="0"></td>
                        <td><input v-model="editItem.description" type="text"></td>
                        <td class="center" style="white-space: nowrap;">
                            <div style="display: flex; gap: 8px;">
                                <button class="btn btn-green" @click="saveEdit">Save</button>
                                <button class="btn btn-gray" @click="cancelEdit">Cancel</button>
                            </div>
                        </td>
                    </template>
                </tr>
            </tbody>
        </table>

        <br>

        <!-- POST Form -->
        <form @submit.prevent="createMenu">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <h3 style="margin: 0;">Add New Menu Item (POST)</h3>
                <button type="submit" class="btn btn-blue">Add Menu Items (POST)</button>
            </div>
            <div id="grid-post">
                <label style="grid-column: 1 / 3; grid-row: 1 / 2; font-size: 14px; margin-bottom: 10px;">Name: <input v-model="newItem.name" type="text" required></label>
                <label style="grid-column: 1 / 2; grid-row: 2 / 3; font-size: 14px; margin-bottom: 10px;">Type: 
                    <select v-model="newItem.type" required>
                        <option value="Food">Food</option>
                        <option value="Drink">Drink</option>
                    </select>
                </label>
                <label style="grid-column: 2 / 3; grid-row: 2 / 3; font-size: 14px; margin-bottom: 10px;">Price ($): <input v-model.number="newItem.price" type="number" step="0.01" min="0" required></label>
                <label style="grid-column: 1 / 3; grid-row: 3 / 4; font-size: 14px; margin-bottom: 10px;">Description: <input v-model="newItem.description" type="text"></label>
            </form>
        </div>
    </div>

    <!-- VUE -->
    <script>
        const { createApp } = Vue;

        createApp({
            data() {
                return {
                    menus: [],
                    newItem: { name: '', type: 'Food', price: '', description: '' },
                    editingId: null,
                    editItem: { id: null, name: '', type: 'Food', price: 0, description: '' },
                    apiEndpoint: '',
                    needsRefresh: false
                };
            },
            mounted() {
                // How it determine apiEndpoint?
                // Window.location.pathname will return the current path (e.g. /php-slim/02_HTTP_Request.php).
                // .lastIndexOf('/') will return the index of the last slash. 
                // .substring(0, ...) will return the string from the beginning (0 Index) to the last slash (Index determined by lastIndexOf method).  
                // Since we append `/menus` in the end, the final result will be `/php-slim/menus`.
                const basePath = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/'));
                this.apiEndpoint = `${basePath}/menus`;
                this.fetchMenus();
            },
            methods: {
                // Request GET Method From "01_HTTP_Methods.php"
                fetchMenus() {
                    fetch(this.apiEndpoint)
                        .then(res => res.json())
                        .then(json => {
                            if (json.success) {
                                this.menus = json.data;
                                this.needsRefresh = false;
                            }
                            else alert("GET failed: " + json.error);
                        })
                        .catch(err => alert("GET failed: " + err.message));
                },
                // Request POST Method From "01_HTTP_Methods.php"
                createMenu() {
                    fetch(this.apiEndpoint, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify(this.newItem)
                    })
                    .then(res => res.json())
                    .then(json => {
                        if (json.success) {
                            this.newItem = { name: '', type: 'Food', price: '', description: '' };
                            this.needsRefresh = true;
                        }
                        else alert("POST failed: " + json.error);
                    })
                    .catch(err => alert("POST failed: " + err.message));
                },
                startEdit(menu) {
                    this.editingId = menu.id;
                    this.editItem = { ...menu };
                },
                cancelEdit() {
                    this.editingId = null;
                },
                // Request PUT Method From "01_HTTP_Methods.php"
                saveEdit() {
                    fetch(this.apiEndpoint, {
                        method: 'PUT',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify(this.editItem)
                    })
                    .then(res => res.json())
                    .then(json => {
                        if (json.success) {
                            this.editingId = null;
                            this.needsRefresh = true;
                        }
                        else alert("PUT failed: " + json.error);
                    })
                    .catch(err => alert("PUT failed: " + err.message));
                },
                // Request DELETE Method From "01_HTTP_Methods.php"
                deleteMenu(id) {
                    if (!confirm("Delete item " + id + "?")) return;
                    fetch(this.apiEndpoint, {
                        method: 'DELETE',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ id: parseInt(id) })
                    })
                    .then(res => res.json())
                    .then(json => {
                        if (json.success) {
                            this.needsRefresh = true;
                        }
                        else alert("DELETE failed: " + json.error);
                    })
                    .catch(err => alert("DELETE failed: " + err.message));
                }
            }
        }).mount('#app');
    </script>
</body>

</html>
