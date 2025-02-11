module ApplicationHelper
  def category_color_class(category_name)
    case category_name
    when 'Housing'
      'bg-teal-100'
    when 'Savings'
      'bg-blue-100'
    when 'Transportation'
      'bg-purple-100'
    when 'Food'
      'bg-pink-100'
    when 'Utilities'
      'bg-yellow-100'
    else
      'bg-green-100'
    end
  end

  def category_description(category_name)
    case category_name
    when 'Housing'
      'Rent, Mortgage, Utilities'
    when 'Savings'
      'Emergency Fund, Investments'
    when 'Transportation'
      'Fuel, Public Transport, Maintenance'
    when 'Food'
      'Groceries, Dining Out'
    when 'Utilities'
      'Electricity, Water, Internet'
    else
      'Entertainment, Shopping'
    end
  end

  def category_icon(category_name)
    case category_name.downcase
    when 'housing'
      '<svg class="w-6 h-6 text-teal-600" fill="currentColor" viewBox="0 0 20 20">
        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
      </svg>'.html_safe
    when 'savings'
      '<svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
        <path d="M4 4a2 2 0 00-2 2v1h16V6a2 2 0 00-2-2H4z" />
        <path fill-rule="evenodd" d="M18 9H2v5a2 2 0 002 2h12a2 2 0 002-2V9zM4 13a1 1 0 011-1h1a1 1 0 110 2H5a1 1 0 01-1-1zm5-1a1 1 0 100 2h1a1 1 0 100-2H9z" clip-rule="evenodd" />
      </svg>'.html_safe
    # Add more cases for other categories
    else
      '<svg class="w-6 h-6 text-gray-600" fill="currentColor" viewBox="0 0 20 20">
        <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd" />
      </svg>'.html_safe
    end
  end
end
