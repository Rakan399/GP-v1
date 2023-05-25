const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const db = admin.firestore();
exports.sendNotificationOnReportCreate = functions.firestore
  .document("Report/{reportId}")
  .onCreate(async (snapshot, context) => {
    // Get the report data
    try {
      const report = snapshot.data();
      const plateNumber = report.car.Plate_number;
      const reporter = report.reporter;


      // Check if the plateNumber exists in the "Car" collection
      const carSnapshot = await db
        .collection("Car")
        .where("Plate_number", "==", plateNumber)
        .get();


      if (!carSnapshot.empty) {
        // Plate number found in the "Car" collection
        const car = carSnapshot.docs[0].data();
        const userToken = car.user.token;


        // Send notification to the user
        const payload = {
          notification: {
            title: "Warning",
            body: `Your car with plate number ${plateNumber} has been found`,
          },
        };

        await admin.messaging().sendToDevice(userToken, payload);

        await db
          .collection("Report")
          .doc(snapshot.id)
          .update({ owner: car.user });

        await db
          .collection("Car")
          .doc(car.Plate_number + car.car_company)
          .update({ status: "found" });

      }
    } catch (error) {
      console.log(
        `    ${error} `
      );
    }
  });
exports.sendNotificationOnCarCreate = functions.firestore
  .document("Car/{CarId}")
  .onCreate(async (snapshot, context) => {
    // Get the report data
    try {
      const car = snapshot.data();
      const plateNumber = car.Plate_number;
      const user = car.user;


      // Check if the plateNumber exists in the "Car" collection
      const reportSnapshot = await db
        .collection("Report")
        .where("car.Plate_number", "==", plateNumber)
        .get();


      if (!reportSnapshot.empty) {
        // Send notification to the user
        const payload = {
          notification: {
            title: "Attention",
            body: `Your car with plate number ${plateNumber} has been reported by another user`,
          },
        };

        await admin.messaging().sendToDevice(user.token, payload);

        await db
          .collection("Report")
          .doc(reportSnapshot.docs[0].id)
          .update({ owner: car.user });

        await db
          .collection("Car")
          .doc(car.Plate_number + car.car_company)
          .update({ status: "found" });

      }
    } catch (error) {
      console.log(
        `    ${error} `
      );
    }
  });

