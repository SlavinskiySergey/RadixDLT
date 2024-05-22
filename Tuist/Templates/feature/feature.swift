import ProjectDescription

let featureName: Template.Attribute = .required("name")
let featurePath = "Modules/"

let featureTemplate = Template(
  description: "Feature template",
  attributes: [
    featureName
  ],
  items: [
    .file(
      path: featurePath + "\(featureName)Feature/Project.swift",
      templatePath: "Project.stencil"
    ),
    .file(
      path: featurePath + "\(featureName)Feature/src/\(featureName)Reducer.swift",
      templatePath: "FeatureReducer.stencil"
    ),
    .file(
      path: featurePath + "\(featureName)Feature/src/\(featureName)View.swift",
      templatePath: "FeatureView.stencil"
    )
  ]
)
