# VS Code Configuration Setup

This guide helps you set up your custom VS Code configuration files, including `settings.json`, `keybindings.json`, `custom-scripts.js`, and `extensions.jsfile`, on a Windows 11 system.

## Step 1: Locate the VS Code Configuration Directory

### VS Code Configuration Folder

On Windows, the configuration files for VS Code are stored in the following location:

```
C:\Users\Prometheus\AppData\Roaming\Code\User\
```

To access this folder:

1. Press `Win + R` to open the **Run** dialog box.
2. Type `%APPDATA%\Code\User` and press **Enter**.
3. This will open the `User` folder where you can place your configuration files.

---

## Step 2: Place Your Files in the Appropriate Locations

### 1. `settings.json`

- **Description**: Contains VS Code user settings such as themes, fonts, and editor behavior.
- **Location**:
  Place the `settings.json` file in:
  ```
  C:\Users\Prometheus\AppData\Roaming\Code\User\settings.json
  ```

### 2. `keybindings.json`

- **Description**: Customizes your keyboard shortcuts for VS Code.
- **Location**:
  Place the `keybindings.json` file in:
  ```
  C:\Users\Prometheus\AppData\Roaming\Code\User\keybindings.json
  ```

### 3. `custom-scripts.js`

- **Description**: Contains custom JavaScript snippets or scripts for automating tasks in VS Code (if you have an extension that supports scripts).
- **Location**:
  Place the `custom-scripts.js` file in your workspace folder or a specific extension's folder, depending on usage.

  **Example**: If you are using an extension to run custom scripts, refer to the extension's documentation to find the correct folder.

### 4. `extensions.js`

- **Description**: A file for managing or listing VS Code extensions (e.g., for automating extension installation).
- **Location**:
  Place this file in any convenient location, such as:
  ```
  C:\Users\Prometheus\VSCode\extensions.js
  ```
  Use this file alongside a script or tool to automate extension installation.

---

## Step 3: Restart VS Code

After placing all your configuration files, restart VS Code to apply the changes.

---

## Notes

- Ensure you back up your original `settings.json` and `keybindings.json` files before replacing them.
- If you encounter issues, double-check the file paths and contents of your configuration files.
- For extension-related scripts, verify that the extensions listed in `extensions.js` are valid.
