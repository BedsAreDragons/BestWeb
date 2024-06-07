-- Function to show a page and hide others
function showPage(pageId)
  -- Hide all pages
  local pages = get("page", true)
  for _, page in ipairs(pages) do
    page.classList.remove("active")
  end
  -- Show the selected page
  local selectedPage = get(pageId)
  selectedPage.classList.add("active")
end

-- Function to perform search
function performSearch()
  local query = get("searchInput").get_contents():lower()
  local resultsDiv = get("results")
  resultsDiv.set_contents('')

  local contentIndex = {
    { id = 1, title = 'Home Page', content = 'Welcome to the home page!' },
    { id = 2, title = 'About Page', content = 'Learn more about us on this page.' },
    -- Add more content as needed
  }

  for _, item in ipairs(contentIndex) do
    if string.find(item.title:lower(), query) or string.find(item.content:lower(), query) then
      local resultItem = '<div>' .. item.title .. ': ' .. item.content .. '</div>'
      resultsDiv.set_contents(resultsDiv.get_contents() .. resultItem)
    end
  end
end

-- Add event listeners
local navButtons = get("nav-btn", true)
for _, button in ipairs(navButtons) do
  button.on_click(function()
    showPage(button.get_attribute("data-target"))
  end)
end

get("search-btn").on_click(performSearch)

-- Initial page load
showPage('home')
