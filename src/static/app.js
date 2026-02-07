document.addEventListener("DOMContentLoaded", () => {
  const activitiesList = document.getElementById("activities-list");
  const activitySelect = document.getElementById("activity");
  const signupForm = document.getElementById("signup-form");
  const messageDiv = document.getElementById("message");
  const categoryFilter = document.getElementById("category-filter");
  const sortBy = document.getElementById("sort-by");
  const searchInput = document.getElementById("search-input");
  
  let allActivities = {};

  // Function to fetch activities from API
  async function fetchActivities() {
    try {
      const response = await fetch("/activities");
      allActivities = await response.json();
      renderActivities();
    } catch (error) {
      activitiesList.innerHTML =
        "<p>Failed to load activities. Please try again later.</p>";
      console.error("Error fetching activities:", error);
    }
  }

  // Function to filter and sort activities
  function getFilteredAndSortedActivities() {
    const categoryValue = categoryFilter.value;
    const sortValue = sortBy.value;
    const searchValue = searchInput.value.toLowerCase();

    // Convert activities object to array for easier manipulation
    let activitiesArray = Object.entries(allActivities).map(([name, details]) => ({
      name,
      ...details
    }));

    // Apply category filter
    if (categoryValue !== "all") {
      activitiesArray = activitiesArray.filter(
        activity => activity.category === categoryValue
      );
    }

    // Apply search filter
    if (searchValue) {
      activitiesArray = activitiesArray.filter(activity => {
        const searchText = `${activity.name} ${activity.description} ${activity.schedule} ${activity.category}`.toLowerCase();
        return searchText.includes(searchValue);
      });
    }

    // Apply sorting
    switch (sortValue) {
      case "name":
        activitiesArray.sort((a, b) => a.name.localeCompare(b.name));
        break;
      case "name-desc":
        activitiesArray.sort((a, b) => b.name.localeCompare(a.name));
        break;
      case "date":
        activitiesArray.sort((a, b) => new Date(a.created_at) - new Date(b.created_at));
        break;
      case "date-desc":
        activitiesArray.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
        break;
      case "availability":
        activitiesArray.sort((a, b) => {
          const spotsA = a.max_participants - a.participants.length;
          const spotsB = b.max_participants - b.participants.length;
          return spotsB - spotsA;
        });
        break;
      case "availability-desc":
        activitiesArray.sort((a, b) => {
          const spotsA = a.max_participants - a.participants.length;
          const spotsB = b.max_participants - b.participants.length;
          return spotsA - spotsB;
        });
        break;
    }

    return activitiesArray;
  }

  // Function to render activities
  function renderActivities() {
    // Clear existing content
    activitiesList.innerHTML = "";
    
    // Populate select dropdown with all activities (not filtered)
    activitySelect.innerHTML = '<option value="">-- Select an activity --</option>';
    Object.keys(allActivities).forEach((name) => {
      const option = document.createElement("option");
      option.value = name;
      option.textContent = name;
      activitySelect.appendChild(option);
    });

    const activitiesArray = getFilteredAndSortedActivities();

    if (activitiesArray.length === 0) {
      activitiesList.innerHTML = "<p>No activities found matching your criteria.</p>";
      return;
    }

    // Populate activities list
    activitiesArray.forEach((activity) => {
      const activityCard = document.createElement("div");
      activityCard.className = "activity-card";

      const spotsLeft = activity.max_participants - activity.participants.length;

      // Create participants HTML with delete icons instead of bullet points
      const participantsHTML =
        activity.participants.length > 0
          ? `<div class="participants-section">
            <h5>Participants:</h5>
            <ul class="participants-list">
              ${activity.participants
                .map(
                  (email) =>
                    `<li><span class="participant-email">${email}</span><button class="delete-btn" data-activity="${activity.name}" data-email="${email}">❌</button></li>`
                )
                .join("")}
            </ul>
          </div>`
          : `<p><em>No participants yet</em></p>`;

      activityCard.innerHTML = `
        <h4>${activity.name}</h4>
        <p>${activity.description}</p>
        <p><strong>Category:</strong> ${activity.category}</p>
        <p><strong>Schedule:</strong> ${activity.schedule}</p>
        <p><strong>Availability:</strong> ${spotsLeft} spots left</p>
        <div class="participants-container">
          ${participantsHTML}
        </div>
      `;

      activitiesList.appendChild(activityCard);
    });

    // Add event listeners to delete buttons
    document.querySelectorAll(".delete-btn").forEach((button) => {
      button.addEventListener("click", handleUnregister);
    });
  }

  // Handle unregister functionality
  async function handleUnregister(event) {
    const button = event.target;
    const activity = button.getAttribute("data-activity");
    const email = button.getAttribute("data-email");

    try {
      const response = await fetch(
        `/activities/${encodeURIComponent(
          activity
        )}/unregister?email=${encodeURIComponent(email)}`,
        {
          method: "DELETE",
        }
      );

      const result = await response.json();

      if (response.ok) {
        messageDiv.textContent = result.message;
        messageDiv.className = "success";

        // Refresh activities list to show updated participants
        await fetchActivities();
      } else {
        messageDiv.textContent = result.detail || "An error occurred";
        messageDiv.className = "error";
      }

      messageDiv.classList.remove("hidden");

      // Hide message after 5 seconds
      setTimeout(() => {
        messageDiv.classList.add("hidden");
      }, 5000);
    } catch (error) {
      messageDiv.textContent = "Failed to unregister. Please try again.";
      messageDiv.className = "error";
      messageDiv.classList.remove("hidden");
      console.error("Error unregistering:", error);
    }
  }

  // Handle form submission
  signupForm.addEventListener("submit", async (event) => {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const activity = document.getElementById("activity").value;

    try {
      const response = await fetch(
        `/activities/${encodeURIComponent(
          activity
        )}/signup?email=${encodeURIComponent(email)}`,
        {
          method: "POST",
        }
      );

      const result = await response.json();

      if (response.ok) {
        messageDiv.textContent = result.message;
        messageDiv.className = "success";
        signupForm.reset();

        // Refresh activities list to show updated participants
        await fetchActivities();
      } else {
        messageDiv.textContent = result.detail || "An error occurred";
        messageDiv.className = "error";
      }

      messageDiv.classList.remove("hidden");

      // Hide message after 5 seconds
      setTimeout(() => {
        messageDiv.classList.add("hidden");
      }, 5000);
    } catch (error) {
      messageDiv.textContent = "Failed to sign up. Please try again.";
      messageDiv.className = "error";
      messageDiv.classList.remove("hidden");
      console.error("Error signing up:", error);
    }
  });

  // Add event listeners for filters and search
  categoryFilter.addEventListener("change", renderActivities);
  sortBy.addEventListener("change", renderActivities);
  searchInput.addEventListener("input", renderActivities);

  // Initialize app
  fetchActivities();
});
