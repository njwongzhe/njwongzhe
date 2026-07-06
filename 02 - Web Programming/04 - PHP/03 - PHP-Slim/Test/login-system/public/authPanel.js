export default {
    name: "AuthPanel",

    // Receive authentication props from the parent view.
    props: ["is-login", "logged-in-user"],

    data() {
        return {
            username: "",
            password: "",
        };
    },

    methods: {
        // --- Login ---
        async login() {
            // Stringify credentials payload.
            let json = JSON.stringify({
                name: this.username,
                pass: this.password
            });

            try {
                // Send POST request to the login endpoint.
                let response = await fetch("api/login", {
                    method: "POST",
                    body: json
                });

                // Parse response JSON payload.
                let returnedJson = await response.json();

                // If authentication succeeded, notify the parent component.
                if (returnedJson.success === true) {
                    console.log("Login successful.");
                    this.$emit("login-success", returnedJson.data);
                }
                else
                    throw Error("Login failed.");
            } catch (err) {
                alert(err);
            }
        },

        // --- Register ---
        async register() {
            // Stringify registration credentials.
            let json = JSON.stringify({
                name: this.username,
                pass: this.password
            });

            try {
                // Send POST request to create user API.
                let response = await fetch("api/users", {
                    method: "POST",
                    body: json
                });

                // Parse response JSON payload.
                let returnedJson = await response.json();

                // If creation succeeded, emit event to refresh the user table.
                if (returnedJson.success === true) {
                    console.log("New user with id " + returnedJson.data.userId + " is added successfully.");
                    this.$emit("database-change");
                }
                else
                    throw Error("New user is added failed.");
            } catch (err) {
                alert(err);
            }
        },

        // --- Logout ---
        async logout() {
            try {
                // Send POST request to the logout API.
                let response = await fetch("api/logout", {
                    method: "POST"
                });

                // Parse response JSON payload.
                let returnedJson = await response.json();

                // Reload the page on success to wipe state and re-verify cookie.
                if (returnedJson.success === true) {
                    window.location.reload();
                }
                else
                    throw Error("Logout failed.");
            } catch (err) {
                alert(err);
            }
        }
    },

    template: /*HTML*/`
        <div v-show="!isLogin" id="panel">
            <input id="username" type="text" placeholder="Username" v-model="username" required>
            <input id="password" type="text" placeholder="Password" v-model="password" required>
            <button id="login" v-on:click="login">Login</button>
            <button id="register" v-on:click="register">Register</button>
        </div>
        <div v-show="isLogin" id="panelLogined">
            <span id="welcomeMsg">Welcome, {{ loggedInUser }}!</span>
            <button id="logout" v-on:click="logout">Logout</button>
        </div>
    `
};