# GithubClient-iOS

### About:
- Used MVVM design pattern.
- UIKit is used for developing UI.
- Repository pattern used to create a common interface to fetch data from API, which can be extended if we want to retrive from offline storage.
- User images shown in the TableView are cached for a smoother experience.
- Error handling logic added to show UIAlert with retry mechanism, in case of error.

To run the project, open the `GithubClient.xcodeproj` project file in Xcode.

All the usecases given in the problem statement are implemented.

(No third party dependencies are used in this project)

---

### Areas of Improvement:

These are some of the improvements that could be covered:

- Localizing the string constants to be fetched from a `.string` file, from a resource bundle.
- Making the endpoint & API key configurable by using `.plist` for configuration.
- Writing Unit & UI test cases
- Adding a CI-CD pipeline to automate the build & testing process.

---

### Screenshots:

<table>
 <tr>
  <td> <img src="./screenshots/GithubClient home.png" width="200"> </td>
  <td> <img src="./screenshots/GithubClient error handling.png" width="200"> </td>
 </tr>
</table>
